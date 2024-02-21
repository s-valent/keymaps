import Cocoa

let settingsPath = "\(FileManager.default.homeDirectoryForCurrentUser.path)/.config/keymaps"

func loadSettings() -> [Set<Key>: String] {
    var settings: [Set<Key>: [String]] = [:]
    if let contents = try? String(contentsOfFile: settingsPath) {
        let lines = contents.components(separatedBy: .newlines)
        var currentKeys: Set<Key>?

        for line in lines {
            if !line.startsWithWhitespaces(), let colon = line.firstIndex(of: ":"), let keys = parseSettings(key: line[..<colon]) {
                currentKeys = keys
            } else  if let currentKeys = currentKeys {
                var commands = settings[currentKeys] ?? []
                commands.append(line.trimmingCharacters(in: .whitespaces))
                settings[currentKeys] = commands
            }
        }
    }
    return settings.mapValues { $0.joined(separator: "\n") }
}

func parseSettings(key: any StringProtocol) -> Set<Key>? {
    var success = true
    let codes = key.components(separatedBy: "+")
        .map { $0.trimmingCharacters(in: .whitespaces) }
        .compactMap { code in
            let key = Key.from(code: code)
            if key == nil {
                print("failed to parse \(code) as key")
                success = false
            }
            return key
        }
    return success ? Set(codes) : nil
}

extension String {
    func startsWithWhitespaces() -> Bool {
        return self.starts(with: " ") || self.starts(with: "\t")
    }
}
