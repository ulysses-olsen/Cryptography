import Foundation

public typealias Letter = String
let alphabet: [Letter] = "abcdefghijklmnopqrstuvwxyz".map(String.init)

func letter(for number: Int) -> Letter {
    let result = alphabet[number]
    return result
}

func number(for letter: Letter) -> Int? {
    let result = alphabet.index(of: letter)
    return result
}

func validate(number: Int) -> Int {
    if number > 25 {
        return number - 26
    }
    if number < 0 {
        return number + 26
    }
    return number
}

func transform(char: Letter, offset: Int, op: @escaping (Int, Int) -> Int) -> Letter {
    guard let n = number(for: char) else { return char }
    let sum = op(n, offset)
    let validated = validate(number: sum)
    let result = letter(for: validated)
    return result
}

func transform(message: String, key: Letter, op: @escaping (Int, Int) -> Int) -> String {
    let offset = number(for: key)!
    return message
        .map { transform(char: String($0), offset: offset, op: op) }
        .joined()
}

public func encrypt(message: String, key: Letter) -> String {
    
    return transform(message: message.lowercased(), key: key, op: +)
}

public func decrypt(message: String, key: Letter) -> String {
    return transform(message: message.lowercased(), key: key, op: -)
}

public func encrypt(message: String, offset: Int) -> String {
    let key = letter(for: offset)
    return encrypt(message: message, key: key)
}

public func decrypt(message: String, offset: Int) -> String {
    let key = letter(for: offset)
    return decrypt(message: message, key: key)
}

public func encrypt(message: [Int], offset: Int) -> String {
    let msg = message.map { letter(for: $0) }.joined()
    return encrypt(message: msg, offset: offset)
}

public func decrypt(message: [Int], offset: Int) -> String {
    let msg = message.map { letter(for: $0) }.joined()
    return decrypt(message: msg, offset: offset)
}

