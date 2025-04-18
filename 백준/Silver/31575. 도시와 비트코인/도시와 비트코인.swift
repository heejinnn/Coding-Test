
import Foundation

let dx = [1, 0]
let dy = [0, 1]

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]
var arr = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: N), count: M)
var result = false

visited[0][0] = true

for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(line)
}

dfs(0,0)
print(result ? "Yes" : "No")

func dfs(_ x: Int, _ y: Int) {
    if x == M-1 && y == N-1 {
        result = true
        return
    }
    
    for i in 0..<2 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx >= 0, ny >= 0, nx < M, ny < N, arr[nx][ny] == 1, !visited[nx][ny]{
            visited[nx][ny] = true
            dfs(nx, ny)
        }
    }
}

