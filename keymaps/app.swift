import SwiftUI

let maxHistoryCount = 100
var previousModifierEvents: [[Key]] = []
var settings: [Set<Key>: String]!

@main
struct app: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var eventTap: CFMachPort?

    func applicationDidFinishLaunching(_: Notification) {
        let accessEnabled = AXIsProcessTrustedWithOptions(
            [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true] as CFDictionary
        )
        guard accessEnabled else { return }
        print("access: \(accessEnabled)")

        settings = loadSettings()

        let eventMask = (1 << CGEventType.flagsChanged.rawValue) | (1 << CGEventType.keyDown.rawValue)
        eventTap = CGEvent.tapCreate(
            tap: .cgSessionEventTap,
            place: .headInsertEventTap,
            options: .defaultTap,
            eventsOfInterest: CGEventMask(eventMask),
            callback: { (proxy, type, event, refcon) -> Unmanaged<CGEvent>? in
                var processed = false
                let keys = process(event: event)
                if let key = keys.first {
                    if Key.isModifier(key) {
                        // modifier is released
                        if !keys[1...].contains(key) {
                            if let keys = previousModifierEvents.last {
                                processed = handle(keys: Set(keys))
                            }
                            previousModifierEvents = []
                        } else {
                            // shouldn't be called ever
                            if previousModifierEvents.count > maxHistoryCount {
                                previousModifierEvents = []
                            }
                            previousModifierEvents.append(keys)
                        }
                    } else {
                        processed = handle(keys: Set(keys))
                        previousModifierEvents = []
                    }
                }
                return processed ? nil : Unmanaged.passRetained(event)
            }, userInfo: nil)

        if let eventTap = eventTap {
            let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
            CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
            CGEvent.tapEnable(tap: eventTap, enable: true)
        } else {
            print("failed to create event tap")
        }
    }

    func applicationWillTerminate(_: Notification) {
        if let eventTap = eventTap {
            CGEvent.tapEnable(tap: eventTap, enable: false)
            CFMachPortInvalidate(eventTap)
            CFRunLoopStop(CFRunLoopGetCurrent())
        }
    }
}

func process(event: CGEvent) -> [Key] {
    guard let key = Key(rawValue: UInt16(event.getIntegerValueField(.keyboardEventKeycode))) else { return [] }

    if key == .a {
        var char = UniChar()
        var length = 0
        event.keyboardGetUnicodeString(maxStringLength: 1, actualStringLength: &length, unicodeString: &char)
        if char == 0 { return [] }  // sometimes fantom keypresses occur
    }

    let flags = UInt32(event.flags.rawValue)
    var keys = [key]
    for modifier in Modifier.allCases {
        if flags & modifier.rawValue != 0 {
            if modifier == .function && functionKeys.contains(key) { continue }
            keys.append(Key.from(modifier))
        }
    }
    return keys
}

func handle(keys: Set<Key>) -> Bool {
    if let command = settings[keys] {
        runCommand(command)
        return true
    }
    return false
}

func runCommand(_ script: String) {
    let task = Process()
    task.launchPath = "/bin/zsh"
    task.arguments = ["-c", script]
    try? task.run()
}
