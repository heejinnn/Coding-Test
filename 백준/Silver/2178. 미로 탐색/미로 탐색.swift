import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (N, M) = (input[0], input[1])

var arr = Array(repeating: [Int](), count: N+1)

for i in 1..<N+1{
    let line = [0] + readLine()!.map{Int(String($0))!}
    
    arr[i].append(contentsOf: line)
    
}


let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var visited = Array(repeating: Array(repeating: false, count: M+1), count: N+1)
var queue: [(x: Int, y: Int, dist: Int)] = []
var result = 0

bfs(x: 1, y: 1)

func bfs(x: Int, y: Int){
    queue.append((x,y,1))
    visited[x][y] = true

    while !queue.isEmpty{
        let current = queue.removeFirst()
        
        if current.x == N, current.y == M{
            result = current.dist
            return
        }
        
        for i in 0..<4{
            let mx = current.x + dx[i]
            let my = current.y + dy[i]
            
            if mx > 0, my > 0, mx < N+1, my < M+1, arr[mx][my] == 1, !visited[mx][my]{
                queue.append((mx, my, current.dist + 1))
                visited[mx][my] = true
            }
        }
    }
}
print(result)