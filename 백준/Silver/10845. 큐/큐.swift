import Foundation

//push X: 정수 X를 큐에 넣음
//pop: 큐에서 가장 앞에 있는 정수 빼고, 그 수 출력(만약 큐가 비어있다면 -1 출력)
//size: 큐에 들어있는 정수 개수 출력
//empty: 큐가 비어있다면 1, 아니면 0 출력
//front: 큐의 가장 앞에 있는 정수 출력, 비었다면 -1
//back: 큐의 가장 뒤에 있는 정수 출력, 비었다면 -1

let N = Int(readLine()!)!
var queue = [Int]()
var result = [Int]()

for _ in 0..<N {
    
    let input = readLine()!.split(separator: " ").map{String($0)}
    
    switch input[0] {
    case "push":
        queue.append(Int(input[1])!)
        
    case "pop":
        guard !queue.isEmpty else {result.append(-1); continue}
        
        let first = queue.removeFirst()
        result.append(first)
        
    case "front":
        guard !queue.isEmpty else {result.append(-1); continue}
        result.append(queue.first!)
    
    case "back":
        guard !queue.isEmpty else {result.append(-1); continue}
        result.append(queue.last!)
    
    case "size":
        result.append(queue.count)
        
    case "empty":
        result.append(queue.isEmpty ? 1 : 0)
    default:
        continue
    }
}

result.forEach{print($0);}