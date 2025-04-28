let testCase = Int(readLine()!)!

for i in 0..<testCase{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let (count, index) = (input[0], input[1])
    var importance = readLine()!.split(separator: " ").map{Int(String($0))!}

    var queue: [Int] = []
    
    for i in 0..<count{
        queue.append(i)
    }
    
    var max_importance = importance.max()
    var result = 0
    
    while !queue.isEmpty{
        let firstNum = queue.removeFirst()
        let firstIm = importance.removeFirst()
        
        if firstIm < max_importance!{
            queue.append(firstNum)
            importance.append(firstIm)
        }else{
            result += 1
            if firstNum == index{
                print(result)
            }
            max_importance = importance.max()
            
        }
    }
}
