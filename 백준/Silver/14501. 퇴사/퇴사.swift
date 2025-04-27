import Foundation

let N = Int(readLine()!)!

var arr = Array(repeating: [Int](), count: 2)
var dp = Array(repeating: 0, count: N)
var maxVal = 0
var result = 0

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    arr[0].append(input[0])
    arr[1].append(input[1])
}

for i in 0..<N{
    let index = i + arr[0][i] - 1

    if index < N{
        dp[index] = max(dp[index], arr[1][i] + maxVal)
        result = max(dp[index], result)
    }
    maxVal = max(maxVal, dp[i])
}
print(result)


