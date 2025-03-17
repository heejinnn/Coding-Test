let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = [Int](repeating: 0, count: N)

for i in 0..<N {
    var maxValue = arr[i]
    var minValue = arr[i]
    
    for j in stride(from: i, through: 0, by: -1) {
        maxValue = max(maxValue, arr[j])
        minValue = min(minValue, arr[j])
        
        if j > 0 {
            dp[i] = max(dp[i], dp[j - 1] + (maxValue - minValue))
        } else {
            dp[i] = max(dp[i], maxValue - minValue)
        }
    }
}

print(dp[N - 1])


