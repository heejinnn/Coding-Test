let N = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N + 1)
var dp = Array(repeating: Array(repeating: 0, count: 3), count: N + 1)

for i in 1...N{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    (arr[i][0], arr[i][1], arr[i][2]) = (input[0], input[1], input[2])
    
}

for i in 1...N {
    dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + arr[i][0]
    dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + arr[i][1]
    dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + arr[i][2]
}

print(dp[N].min()!)

