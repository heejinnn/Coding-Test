import Foundation

// 1. 커서 기준으로 왼쪽 스택과 오른쪽 스택 나눠서 관리


var leftStack = Array(readLine()!)
var rightStack: [Character] = []
let M = Int(readLine()!)!


for _ in 0..<M{
    
    let input = readLine()!
    
    switch input{
        
    case "L":
        
        if !leftStack.isEmpty{
            let last = leftStack.removeLast()
            rightStack.append(last)
        }
        
    case "D":
        if !rightStack.isEmpty {
            let last = rightStack.removeLast()
            leftStack.append(last)
        }
        
    case "B":
        
        if !leftStack.isEmpty{
            leftStack.removeLast()
        }
        
    default:
        leftStack.append(input.last!)
    }
}

print(String(leftStack + rightStack.reversed()))