import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let R = input[0]
let C = input[1]
let K = input[2]

var map: [[Character]] = []
for _ in 0..<R {
    map.append(Array(readLine()!))
}

var visited = Array(repeating: Array(repeating: false, count: C), count: R)
var count = 0

// 이동 방향: 상, 하, 좌, 우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func dfs(x: Int, y: Int, depth: Int) {
    if x == 0 && y == C - 1 {
        if depth == K {
            count += 1
        }
        return
    }

    for dir in 0..<4 {
        let nx = x + dx[dir]
        let ny = y + dy[dir]

        if nx >= 0 && nx < R && ny >= 0 && ny < C {
            if map[nx][ny] != "T" && !visited[nx][ny] {
                visited[nx][ny] = true
                dfs(x: nx, y: ny, depth: depth + 1)
                visited[nx][ny] = false
            }
        }
    }
}

visited[R - 1][0] = true
dfs(x: R - 1, y: 0, depth: 1)

print(count)
