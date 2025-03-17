//
//let N = Int(readLine()!)!
//
//var arr = [Int](repeating: 0, count: N)
//var dp = [Int](repeating: -1, count: N)
//
//let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//for i in 0..<input.count {
//    arr[i] = input[i]
//}
//
//func jump(_ i: Int) -> Int{
//
//    if i==N-1{
//        return 0
//    }
//    if (dp[i] != -1) {
//        return dp[i];
//    }
//
//    dp[i] = Int.max
//
//    for j in stride(from: i+1, to: N, by: 1){
//        var maxPower = max(jump(j),(j-i)*(1+abs(arr[i]-arr[j])))
//        dp[i] = min(dp[i], maxPower)
//    }
//    return dp[i]
//}
//
//print(jump(0))
