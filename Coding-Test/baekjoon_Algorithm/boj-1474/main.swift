let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, M) = (input[0], input[1])

var arr: [String] = []
var totalSize = 0

for _ in 0..<N {
    let word = readLine()!
    arr.append(word)
    totalSize += word.count
}

let barCnt = (M - totalSize) / (N - 1)
var leftBarCnt = (M - totalSize) % (N - 1)

for i in 1..<N {
    if leftBarCnt > 0 && arr[i].first?.isLowercase == true {
        arr[i] = "_" + arr[i]
        leftBarCnt -= 1
    }
}

for i in stride(from: N - 1, to: 0, by: -1) {
    if leftBarCnt > 0 && arr[i].first?.isUppercase == true {
        arr[i] = "_" + arr[i]
        leftBarCnt -= 1
    }
}

for i in 1..<N {
    for _ in 0..<barCnt {
        arr[i] = "_" + arr[i]
    }
}

for result in arr {
    print(result, terminator: "")
}


