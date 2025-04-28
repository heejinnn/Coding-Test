
import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var importance = readLine()!.split(separator: " ").map{Int($0)!}
    var queue: [Int] = []
    
    for i in 0..<input[0]{
        queue.append(i)
    }
    
    var result = 0
    var maxVal = importance.max()!
    
    while !queue.isEmpty{
        let firstQ = queue.removeFirst()
        let firstIm = importance.removeFirst()
        
        //지금 값보다 importance에 큰 값이 있는 경우
        
        if firstIm < maxVal{
            queue.append(firstQ)
            importance.append(firstIm)
        } else{
            result += 1
            if firstQ == input[1]{
                print(result)
            }
            maxVal = importance.max() ?? 0
        }
    }
}