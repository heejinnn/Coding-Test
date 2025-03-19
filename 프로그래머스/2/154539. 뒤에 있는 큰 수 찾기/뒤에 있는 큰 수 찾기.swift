import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var result = Array(repeating: -1, count: numbers.count)
    var stack = [Int]()
    
    stack.append(0)
    
    for i in 1..<result.count{
        while !stack.isEmpty{
            if numbers[stack.last!] >= numbers[i]{
                break
            }
            result[stack.popLast()!] = numbers[i]
        }
        stack.append(i)
    }
    
    
    return result
}