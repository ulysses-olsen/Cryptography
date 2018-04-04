typealias Letter = String

let alphabet: [Letter] = "abcdefghijklmnopqrstuvwxyz".map(String.init)

func letter(for number: Int) -> Letter {
    let result = alphabet[number]
    return result
}

func number(for letter: Letter) -> Int {
    let result = alphabet.index(of: letter)!
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
    let n = number(for: char)
    let sum = op(n, offset)
    let validated = validate(number: sum)
    let result = letter(for: validated)
    return result
}

func transform(message: String, key: Letter, op: @escaping (Int, Int) -> Int) -> String {
    let offset = number(for: key)
    return message
        .map { transform(char: String($0), offset: offset, op: op) }
        .joined()
}

func encrypt(message: String, key: Letter) -> String {
    return transform(message: message, key: key, op: +)
}

func decrypt(message: String, key: Letter) -> String {
return transform(message: message, key: key, op: -)}

let encrypted = encrypt(message: "hello", key: "e")
let decrypted = decrypt(message: "lipps", key: "e")

let test1 = encrypt(message: "ulysses", key: "u")
let plaintext = decrypt(message: test1, key: "u")

