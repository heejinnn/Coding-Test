import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    
    let dArr = d.sorted()
    var sum = 0
    var result = 0
    
    for i in 0..<dArr.count{
        sum += dArr[i]
        if sum > budget{
            break
        }
        result += 1
    }
    
    
    return result
}