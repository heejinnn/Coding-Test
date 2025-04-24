import Foundation

let N = Int(readLine()!)!
var stair = [Int]()

for _ in 0..<N{
    let input = Int(readLine()!)!
    
    stair.append(input)
}

var dp: [Int] = Array(repeating: 0, count: N)
if N == 1{
    dp[0] = stair[0]
} else if N==2{
    dp[1] = stair[0] + stair[1]
}else{
    dp[0] = stair[0]
    dp[1] = stair[0] + stair[1]
    dp[2] = max(stair[0] + stair[2], stair[1]+stair[2])

    for i in 3..<N{
        let a = dp[i-2] + stair[i]
        let b = dp[i-3] + stair[i-1] + stair[i]
        
        dp[i] = max(a,b)
    }
}

print(dp[N-1])