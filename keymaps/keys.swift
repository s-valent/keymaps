enum Key: UInt16 {
    case returnKey = 0x24
    case enter = 0x4C
    case tab = 0x30
    case space = 0x31
    case delete = 0x33
    case escape = 0x35
    case command = 0x37
    case shift = 0x38
    case capsLock = 0x39
    case option = 0x3A
    case control = 0x3B
    case rightCommand = 0x36
    case rightShift = 0x3C
    case rightOption = 0x3D
    // case rightControl = 0x3E  missing because I don't have a keyboard to get modifier code
    case leftArrow = 0x7B
    case rightArrow = 0x7C
    case downArrow = 0x7D
    case upArrow = 0x7E
    case volumeUp = 0x48
    case volumeDown = 0x49
    case mute = 0x4A
    case help = 0x72
    case home = 0x73
    case pageUp = 0x74
    case forwardDelete = 0x75
    case end = 0x77
    case pageDown = 0x79
    case function = 0x3F
    case f1 = 0x7A
    case f2 = 0x78
    case f4 = 0x76
    case f5 = 0x60
    case f6 = 0x61
    case f7 = 0x62
    case f3 = 0x63
    case f8 = 0x64
    case f9 = 0x65
    case f10 = 0x6D
    case f11 = 0x67
    case f12 = 0x6F
    case f13 = 0x69
    case f14 = 0x6B
    case f15 = 0x71
    case f16 = 0x6A
    case f17 = 0x40
    case f18 = 0x4F
    case f19 = 0x50
    case f20 = 0x5A

    case a = 0x00
    case b = 0x0B
    case c = 0x08
    case d = 0x02
    case e = 0x0E
    case f = 0x03
    case g = 0x05
    case h = 0x04
    case i = 0x22
    case j = 0x26
    case k = 0x28
    case l = 0x25
    case m = 0x2E
    case n = 0x2D
    case o = 0x1F
    case p = 0x23
    case q = 0x0C
    case r = 0x0F
    case s = 0x01
    case t = 0x11
    case u = 0x20
    case v = 0x09
    case w = 0x0D
    case x = 0x07
    case y = 0x10
    case z = 0x06

    case keyboard0 = 0x1D
    case keyboard1 = 0x12
    case keyboard2 = 0x13
    case keyboard3 = 0x14
    case keyboard4 = 0x15
    case keyboard5 = 0x17
    case keyboard6 = 0x16
    case keyboard7 = 0x1A
    case keyboard8 = 0x1C
    case keyboard9 = 0x19

    case equals = 0x18
    case minus = 0x1B
    case semicolon = 0x29
    case apostrophe = 0x27
    case comma = 0x2B
    case period = 0x2F
    case forwardSlash = 0x2C
    case backslash = 0x2A
    case grave = 0x32
    case leftBracket = 0x21
    case rightBracket = 0x1E

    case keypadDecimal = 0x41
    case keypadMultiply = 0x43
    case keypadPlus = 0x45
    case keypadClear = 0x47
    case keypadDivide = 0x4B
    case keypadMinus = 0x4E
    case keypadEquals = 0x51
    case keypad0 = 0x52
    case keypad1 = 0x53
    case keypad2 = 0x54
    case keypad3 = 0x55
    case keypad4 = 0x56
    case keypad5 = 0x57
    case keypad6 = 0x58
    case keypad7 = 0x59
    case keypad8 = 0x5B
    case keypad9 = 0x5C

    static func from(code: String) -> Key? {
        switch code {
        case "return":
            return .returnKey
        case "enter":
            return .enter
        case "tab":
            return .tab
        case "space":
            return .space
        case "del":
            return .delete
        case "esc":
            return .escape
        case "cmd":
            return .command
        case "shift":
            return .shift
        case "caps":
            return .capsLock
        case "opt":
            return .option
        case "ctrl":
            return .control
        case "rcmd":
            return .rightCommand
        case "rshift":
            return .rightShift
        case "ropt":
            return .rightOption
        case "left":
            return .leftArrow
        case "right":
            return .rightArrow
        case "down":
            return .downArrow
        case "up":
            return .upArrow
        case "volumeUp":
            return .volumeUp
        case "volumeDown":
            return .volumeDown
        case "mute":
            return .mute
        case "help":
            return .help
        case "home":
            return .home
        case "pageUp":
            return .pageUp
        case "forwardDelete":
            return .forwardDelete
        case "end":
            return .end
        case "pageDown":
            return .pageDown
        case "function":
            return .function
        case "f1":
            return .f1
        case "f2":
            return .f2
        case "f4":
            return .f4
        case "f5":
            return .f5
        case "f6":
            return .f6
        case "f7":
            return .f7
        case "f3":
            return .f3
        case "f8":
            return .f8
        case "f9":
            return .f9
        case "f10":
            return .f10
        case "f11":
            return .f11
        case "f12":
            return .f12
        case "f13":
            return .f13
        case "f14":
            return .f14
        case "f15":
            return .f15
        case "f16":
            return .f16
        case "f17":
            return .f17
        case "f18":
            return .f18
        case "f19":
            return .f19
        case "f20":
            return .f20
        case "a":
            return .a
        case "b":
            return .b
        case "c":
            return .c
        case "d":
            return .d
        case "e":
            return .e
        case "f":
            return .f
        case "g":
            return .g
        case "h":
            return .h
        case "i":
            return .i
        case "j":
            return .j
        case "k":
            return .k
        case "l":
            return .l
        case "m":
            return .m
        case "n":
            return .n
        case "o":
            return .o
        case "p":
            return .p
        case "q":
            return .q
        case "r":
            return .r
        case "s":
            return .s
        case "t":
            return .t
        case "u":
            return .u
        case "v":
            return .v
        case "w":
            return .w
        case "x":
            return .x
        case "y":
            return .y
        case "z":
            return .z
        case "0":
            return .keyboard0
        case "1":
            return .keyboard1
        case "2":
            return .keyboard2
        case "3":
            return .keyboard3
        case "4":
            return .keyboard4
        case "5":
            return .keyboard5
        case "6":
            return .keyboard6
        case "7":
            return .keyboard7
        case "8":
            return .keyboard8
        case "9":
            return .keyboard9
        case "=":
            return .equals
        case "-":
            return .minus
        case ";":
            return .semicolon
        case "'":
            return .apostrophe
        case ",":
            return .comma
        case ".":
            return .period
        case "/":
            return .forwardSlash
        case "\\":
            return .backslash
        case "`":
            return .grave
        case "[":
            return .leftBracket
        case "]":
            return .rightBracket
        case "keypadDecimal":
            return .keypadDecimal
        case "keypadMultiply":
            return .keypadMultiply
        case "keypadPlus":
            return .keypadPlus
        case "keypadClear":
            return .keypadClear
        case "keypadDivide":
            return .keypadDivide
        case "keypadMinus":
            return .keypadMinus
        case "keypadEquals":
            return .keypadEquals
        case "keypad0":
            return .keypad0
        case "keypad1":
            return .keypad1
        case "keypad2":
            return .keypad2
        case "keypad3":
            return .keypad3
        case "keypad4":
            return .keypad4
        case "keypad5":
            return .keypad5
        case "keypad6":
            return .keypad6
        case "keypad7":
            return .keypad7
        case "keypad8":
            return .keypad8
        case "keypad9":
            return .keypad9
        default:
            return nil
        }
    }

    static func from(_ modifier: Modifier) -> Key {
        switch modifier {
        case .command:
            return .command
        case .shift:
            return .shift
        case .option:
            return .option
        case .control:
            return .control
        case .rightCommand:
            return .rightCommand
        case .rightShift:
            return .rightShift
        case .rightOption:
            return .rightOption
        case .function:
            return .function
        }
    }

    static func isModifier(_ key: Key) -> Bool {
        switch key {
        case .command, .shift, .option, .control, .rightCommand, .rightShift, .rightOption, .function:
            return true
        default:
            return false
        }
    }
}

enum Modifier: UInt32, CaseIterable {
    case command = 0b1000
    case shift = 0b10
    case option = 0b100000
    case control = 0b1
    case rightCommand = 0b10000
    case rightShift = 0b100
    case rightOption = 0b1000000
    case function = 0b100000000000000000000000
}

// keys that explicitly add fn modifier
let functionKeys: [Key] = [
    .leftArrow,
    .rightArrow,
    .upArrow,
    .downArrow,
    .home,
    .end,
    .pageUp,
    .pageDown,
    .enter,
    .forwardDelete,
    .f1,
    .f2,
    .f4,
    .f5,
    .f6,
    .f7,
    .f3,
    .f8,
    .f9,
    .f10,
    .f11,
    .f12,
    .f13,
    .f14,
    .f15,
    .f16,
    .f17,
    .f18,
    .f19,
    .f20,
]
