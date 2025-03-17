let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let (N, T) = (input[0], input[1])

var arr = [[Int]](repeating: [Int](repeating: 0, count: 2), count: N)
var dp = [Int](repeating: 0, count: 10001)

var time = 0

for i in 0..<N {
    let chapter = readLine()!.split(separator: " ").map { Int(String($0))! }

    let (K, S) = (chapter[0], chapter[1])

    arr[i][0] = K
    arr[i][1] = S
}

for i in 0..<N {
    time = arr[i][0]
    for j in stride(from: T, through: time, by: -1) {
        dp[j] = max(dp[j], dp[j - time] + arr[i][1])
    }
}

print(dp[T])


