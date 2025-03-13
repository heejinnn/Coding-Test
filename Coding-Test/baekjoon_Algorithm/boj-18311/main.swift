let input = readLine()!.split(separator: " ").map{Int(String($0))!}

var (N, K) = (input[0], input[1])
var arr: [Int] = []
var dp = [Int](repeating: 0, count: N+1)

var result = 1

let dist = readLine()!.split(separator: " ").map{Int(String($0))!}
arr.append(0)
for d in dist{
    arr.append(d)
}

for i in 1...N{
    dp[i] = dp[i-1] + arr[i]
}

if K > dp[N]{
    K = dp[N] - (K - dp[N])
}else if K == dp[N]{
    K = dp[N]-1
}

for i in 0...N{
    if dp[i] > K{
        continue
    }
    else {
        result = i + 1
    }
}

print(result)
