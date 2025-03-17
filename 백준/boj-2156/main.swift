let n = Int(readLine()!)!
var arr:[Int] = []
var dp = Array(repeating: 0, count: n+1)
arr.append(0)

for _ in 1...n {
    arr.append(Int(readLine()!)!)
}

dp[1] = arr[1]
if n >= 2 {
    dp[2] = arr[1] + arr[2]
}

for i in stride(from: 3, through: n, by: 1) {
    dp[i] = max(dp[i - 2] + arr[i], dp[i - 3] + arr[i] + arr[i - 1], dp[i - 1])
}

print(dp[n])


