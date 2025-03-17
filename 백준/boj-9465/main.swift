let T = Int(readLine()!)!

for _ in 0..<T{
    let n = Int(readLine()!)!
    
    var arr = [[Int
               ]](repeating: [Int](), count: 2)
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: 2)
    for i in 0..<2{
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        arr[i].append(contentsOf: input)
    }
    
    if n == 1{
        print(max(arr[0][0], arr[1][0]))
        continue
    }else{
        dp[0][0] = arr[0][0]
        dp[1][0] = arr[1][0]
        
        dp[0][1] = dp[1][0] + arr[0][1]
        dp[1][1] = dp[0][0] + arr[1][1]
        
        for i in 2..<n{
            dp[0][i] = arr[0][i] + max(dp[1][i-1], dp[1][i-2])
            dp[1][i] = arr[1][i] + max(dp[0][i-1], dp[0][i-2])
        }
    }
    print(max(dp[0][n-1], dp[1][n-1]))
}

