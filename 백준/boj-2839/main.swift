var N = Int(readLine()!)!
var dp = [Int](repeating: 0, count: N+1)
var result = 0

if N%5 == 0 {
    print(N/5)
}
else{
    while N>0{
        result+=1
        N -= 3
        if N % 5 == 0 {
            result += N/5
            print(result)
            break
        }
        if N < 3, N < 5{
            print(-1)
            break
        }
    }
}




