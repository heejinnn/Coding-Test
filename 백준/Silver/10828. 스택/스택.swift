import Foundation
let n = Int(readLine()!)!

var stack: [Int] = []
var result: [Int] = []

for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map{String($0)}
    
    switch input[0]{
    case "push":
        stack.append(Int(input[1])!)
        
    case "pop":
        guard stack.count > 0 else {result.append(-1); continue}
        let last = stack.removeLast()
        result.append(last)
        
    case "top":
        guard stack.count > 0 else {result.append(-1); continue}
        result.append(stack.last!)
    case "empty":
        result.append(stack.count > 0 ? 0 : 1)
    default:
        result.append(stack.count)
    }
}

result.forEach{print($0);}