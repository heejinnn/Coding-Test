
let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (N,K) = (input[0], input[1])
var dp = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: K+1)

for i in 0...K{
    dp[i][0] = 1
}

if K >= 1{
    for i in 1...K{
        for j in 1...N{
            dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % 1000000000
        }
    }
}

print(dp[K][N])
