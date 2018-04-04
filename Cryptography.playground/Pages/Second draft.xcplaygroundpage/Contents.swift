let message = [
    3, 14, 7, 0,
    19, 21, 25, 0,
    22, 11, 21, 22, 18, 11,
    10, 21,
    3, 14, 11, 20,
    15, 0,
    24, 7, 15, 20, 25
]
let plaintext = decrypt(message: message, offset: 7)
let ciphertext = encrypt(message: plaintext, offset: 7)
let d = decrypt(message: ciphertext, offset: 7)

