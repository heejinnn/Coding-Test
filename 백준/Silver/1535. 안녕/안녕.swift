
import Foundation

let n = Int(readLine()!)!

let line1 = readLine()!.split(separator: " ").map{Int($0)!}
let staminas = line1.map{Int(exactly: $0)!}

let line2 = readLine()!.split(separator: " ").map{Int($0)!}
let pleasures = line2.map{Int(exactly: $0)!}

var dp = Array(repeating: 0, count: 100)

for i in 0..<n{

    for j in stride(from: 100 - 1, through: staminas[i], by: -1) {
        dp[j] = max(dp[j], dp[j - staminas[i]] + pleasures[i])
    }
    
}

print(dp.max()!)