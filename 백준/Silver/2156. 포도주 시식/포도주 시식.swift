
import Foundation


// 포도주 마시는 경우의 수
// 1. i번째 포도주를 안 마시는 경우
// 2. i번째만 마시고, i-1은 안 마시는 경우
// 3. i번째와 i-1번째를 마시고, i-2는 안 마시는 경우
let n = Int(readLine()!)!

var wines = Array(repeating: 0, count: n+1)
var dp = Array(repeating: 0, count: n+1)

wines[0] = 0
for i in 1...n{
    wines[i] = Int(readLine()!)!
}

if n >= 1 {
    dp[1] = wines[1]
}

if n >= 2{
    dp[2] = wines[1] + wines[2]
}

if n>=3{
    for i in 3...n{
        dp[i] = max(dp[i-1], dp[i-2] + wines[i] , dp[i-3] + wines[i-1] + wines[i])
    }
}
print(dp.max()!)