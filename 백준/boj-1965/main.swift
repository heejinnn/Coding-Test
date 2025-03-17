let n = Int(readLine()!)!

var arr:[Int] = []

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

for i in input{
    arr.append(i)
}

var dp = Array(repeating: 1, count: n+1)

for i in 1..<n {
    for j in 0..<i {
        if dp[i] <= dp[j] && arr[j] < arr[i] {
            dp[i] = dp[j] + 1
        }
    }
}

print(dp.max()!)


