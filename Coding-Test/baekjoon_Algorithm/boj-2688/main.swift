let T = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 1, count: 10), count: 65)


for i in 2...64{
    for j in 0...9{
        var sum = 0
        for k in 0...j{
            sum += dp[i-1][k]
        }
        dp[i][j] = sum
    }
}


for _ in 0..<T {
    let n = Int(readLine()!)!
    print(dp[n].reduce(0, +))
}



