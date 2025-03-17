let N = Int(readLine()!)!
let mod = 9901

var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)

dp[0][0] = 1
dp[0][1] = 1
dp[0][2] = 1

for i in 1..<N{
    dp[i][0] = dp[i-1][1] + dp[i-1][2]
    dp[i][1] = dp[i-1][0] + dp[i-1][2]
    dp[i][2] = dp[i-1][0] + dp[i-1][1] + dp[i-1][2]
    
    dp[i][0] %= mod
    dp[i][1] %= mod
    dp[i][2] %= mod
}

print(dp[N-1].reduce(0,+) % mod)

