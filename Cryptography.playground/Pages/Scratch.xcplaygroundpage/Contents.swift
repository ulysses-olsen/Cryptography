for n in -10...30 {
//    print(n % 26)
}

(-1) % 26

func mod(a: Int, b: Int) -> Int {
    let r = a % b;
    return r < 0 ? r + b : r;
}

mod(a: -1, b: 26)
