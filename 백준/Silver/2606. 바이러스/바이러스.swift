
import Foundation

let N = Int(readLine()!)!
let line = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: N + 1)

for _ in 1..<line+1{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

var visited = Array(repeating: false, count: N + 1)
var queue = [Int]()
var result = 0

bfs(start: 1)
func bfs(start: Int){
    visited[start] = true
    queue.append(start)
    
    while !queue.isEmpty{
        
        let current = queue.removeFirst()
        
        for node in graph[current]{
            if !visited[node] {
                result += 1
                queue.append(node)
                visited[node] = true
            }
        }
    }
}
print(result)
