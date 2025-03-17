let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (N,D) = (input[0], input[1])
var dp = [Int](0...D)

var arr = [[Int]]()

for _ in 0..<N{
    let road = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append(road)
}

for i in 0..<D+1{
    if i > 0 {
        dp[i] = min(dp[i], dp[i-1] + 1)
    }
    for r in arr{
        let (s,e,d) = (r[0], r[1], r[2])
        
        if i==s && e<=D && dp[i]+d < dp[e]{
            dp[e] = dp[i]+d
        }
    }
}
print(dp[D])


