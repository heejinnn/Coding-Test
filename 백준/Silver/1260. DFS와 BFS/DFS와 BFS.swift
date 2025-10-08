import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (N,M,V) = (input[0], input[1], input[2])

var graph = Array(repeating: [Int](), count: N + 1)

for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let (a, b) = (line[0], line[1])
    graph[a].append(b)
    graph[b].append(a)
}

for i in 1...N {
    graph[i].sort()
}

var visitedDfs = Array(repeating: false, count: N+1)
var result = Array(repeating: [Int](), count: 2)
dfs(start: V)

func dfs(start: Int){
    
    visitedDfs[start] = true
    result[0].append(start)
    
    for node in graph[start]{
        
        if !visitedDfs[node] {
            dfs(start: node)
        }
    }
}

var visitedBfs = Array(repeating: false, count: N+1)
var queue = [Int]()

bfs(start: V)

func bfs(start: Int){
    queue.append(start)
    visitedBfs[start] = true
    result[1].append(start)
    
    while !queue.isEmpty{
        
        let first = queue.removeFirst()
        
        for node in graph[first]{
            if !visitedBfs[node]{
                queue.append(node)
                visitedBfs[node] = true
                result[1].append(node)
            }
        }
    }
}

for i in 0..<2{
    result[i].forEach{print($0, terminator: " ")}
    print()
}
