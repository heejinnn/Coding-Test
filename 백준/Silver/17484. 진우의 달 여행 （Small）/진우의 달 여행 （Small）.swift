import Foundation

//왼쪽 아래, 아래, 오른쪽 아래로만 이동 가능
//같은 방향으로 두번 연속 움직일 수 x
//1. dfs로 탐색

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

var map = [[Int]]()
for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dx = [-1, 0, 1]
let INF = Int.max
var answer = INF

var visited = Array(repeating: Array(repeating: Array(repeating: INF, count: 3), count: M), count: N)

func dfs(y: Int, x: Int, prevDir: Int, fuel: Int) {
    if y == N - 1 {
        answer = min(answer, fuel)
        return
    }
    
    for dir in 0..<3 {
        if dir == prevDir { continue }  // 같은 방향 연속 X
        let ny = y + 1
        let nx = x + dx[dir]
        if ny >= N || nx < 0 || nx >= M { continue }
        
        let nextFuel = fuel + map[ny][nx]
        if visited[ny][nx][dir] > nextFuel {
            visited[ny][nx][dir] = nextFuel
            dfs(y: ny, x: nx, prevDir: dir, fuel: nextFuel)
        }
    }
}

for j in 0..<M {
    for dir in 0..<3 {
        visited[0][j][dir] = map[0][j]
        dfs(y: 0, x: j, prevDir: dir, fuel: map[0][j])
    }
}

print(answer)