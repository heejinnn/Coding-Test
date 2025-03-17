import Foundation
let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (n,k) = (input[0], input[1])
var dp = [Int](repeating: 0, count: k+1)

var values: [Int] = []

for _ in 0..<n{
    let value = Int(readLine()!)!
    values.append(value)
}

dp[0] = 1

for v in values{
    if k>=v{
        for i in v...k{
            if dp[i] < Int(pow(2.0, 31.0)){
                dp[i] += dp[i-v]
            }
        }
    }
}

print(dp[k])




