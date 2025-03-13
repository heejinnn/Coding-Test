
let n = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: 0, count: n)


dp[0] = arr[0];

var maxResult =  dp[0]

for i in 1..<n{
    dp[i] = max(dp[i - 1] + arr[i], arr[i]);
    maxResult = max(maxResult, dp[i]);
}
    
print(maxResult)

