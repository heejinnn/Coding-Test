let N = Int(readLine()!)!

var arr : [[Int]] = Array(repeating: Array(repeating: 0, count: 2 ), count: N)
var dp : [[Int]] = Array(repeating: Array(repeating: Int.max, count: 2), count: N+4)

dp[1][0] = 0; dp[1][1] = 0;

for i in 1..<N {
    let Input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i][0] = Input[0]
    arr[i][1] = Input[1]
}

let K = Int(readLine()!)!

for i in 1..<N {
    let small = arr[i][0]
    let big = arr[i][1]
    
    for j in 0..<2 {
        dp[i+1][j] = min(dp[i+1][j], dp[i][j] + small)
        dp[i+2][j] = min(dp[i+2][j], dp[i][j] + big)
    }
    
    dp[i+3][1] = min(dp[i+3][1], dp[i][0] + K)
}

print(dp[N].min()!)

