let N = Int(readLine()!)!

var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: N+1)

var cnt = 0

for i in 0...9{
    dp[1][i] = 1
}

if N>1{
    for i in 2...N{
        for j in 0...9{
            if j == 0{
                dp[i][j] = dp[i-1][1] % 1000000000
            }else if j == 9{
                dp[i][j] = dp[i-1][8] % 1000000000
            }else{
                dp[i][j] = dp[i-1][j-1] + dp[i-1][j+1] % 1000000000
            }
        }
    }
}


for i in 1...9{
    cnt+=dp[N][i]  % 1000000000
}

print(cnt % 1000000000)

