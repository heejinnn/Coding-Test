var (N,M) = (1,1)

while N != 0 && M != 0{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    (N, M) = (input[0], input[1])
   
    var numArr = [Int](repeating: 0, count: 10001)
    
    if N != 0 && M != 0{
        for _ in 0..<N{
            let inputWeek = readLine()!.split(separator: " ").map{Int(String($0))!}
            for j in 0..<M{
                numArr[inputWeek[j]] += 1
            }
        }
    }
    
    let maxVal = numArr.max()!
    var secondVal = -1
    
    for i in 0..<10001 {
        if numArr[i] < maxVal {
            secondVal = max(secondVal, numArr[i])
        }
    }
    
    if secondVal != -1 {
        let indexSecondMax = numArr.indices.filter { numArr[$0] == secondVal }
        
        for result in indexSecondMax {
            print(result, terminator: " ")
        }
        print("")
    } else {
        print("")
    }
}

