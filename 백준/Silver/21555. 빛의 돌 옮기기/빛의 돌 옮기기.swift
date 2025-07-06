import Foundation

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let N = firstLine[0]
let K = firstLine[1]

let A = readLine()!.split(separator: " ").map { Int($0)! }
let B = readLine()!.split(separator: " ").map { Int($0)! }

// dp[i][0]: i번째까지 끌고 왔을 때의 최소 비용
// dp[i][1]: i번째까지 들고 왔을 때의 최소 비용
var dp = Array(repeating: [0, 0], count: N)

dp[0][0] = A[0]
dp[0][1] = B[0]

for i in 1..<N {
    dp[i][0] = min(dp[i-1][0] + A[i], dp[i-1][1] + A[i] + K)
    dp[i][1] = min(dp[i-1][1] + B[i], dp[i-1][0] + B[i] + K)
}

print(min(dp[N-1][0], dp[N-1][1]))
