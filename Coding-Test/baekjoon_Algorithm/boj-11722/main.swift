import Foundation

let N = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var A = [Int]()
var dp = [Int](repeating: 1, count: N)

for num in input{
    A.append(num)
}

for i in 1..<N{
    for j in 0..<i{
        if A[i] < A[j]{
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(dp.max()!)



