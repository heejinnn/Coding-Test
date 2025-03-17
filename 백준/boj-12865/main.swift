var Input = readLine()!.split(separator: " ").map{Int(String($0))!}

var (N, K) = (Input[0], Input[1])

var arr : [[Int]] = Array(repeating: Array(repeating: 0, count: 2 ), count: N+1)
var dp : [[Int]] = Array(repeating: Array(repeating: 0, count: K+1 ), count: N+1)

for i in 1..<N + 1{
    let nInput = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i][0] = nInput[0]
    arr[i][1] = nInput[1]
}

for i in 1..<N + 1{
    for j in 1..<K + 1{
        if j-arr[i][0] >= 0 {
            dp[i][j] = max(dp[i-1][j], arr[i][1] + dp[i-1][j-arr[i][0]])
        }else{
            dp[i][j] = dp[i-1][j]
        }
    }
}

print(dp[N][K])



