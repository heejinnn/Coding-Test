import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var arr: [Int] = []
    
    for i in 0..<numbers.count{
        for j in i+1..<numbers.count{
            let value = numbers[i] + numbers[j]
            arr.append(value)
        }
    }
    
    let removeDuplicated = Set(arr)
    var result = Array(removeDuplicated)
    result.sort()

    return result
}