import Foundation

func solution(_ maps:[String]) -> Int {
    
    let rowCount = maps.count
    let colCount = maps[0].count
    let dx = [0, -1, 1, 0]
    let dy = [-1, 0, 0, 1]
    
    var arr = maps.map { $0.map { String($0) } }
    
    var start = (0, 0)
    var lever = (0, 0)
    var exit = (0, 0)
    
    for i in 0..<rowCount {
        for j in 0..<colCount {
            switch arr[i][j] {
            case "S": start = (i, j)
            case "L": lever = (i, j)
            case "E": exit = (i, j)
            default: continue
            }
        }
    }
    
    func bfs(from: (Int, Int), target: String) -> Int {
        var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
        var queue = [(x: Int, y: Int, dist: Int)]()
        queue.append((from.0, from.1, 0))
        visited[from.0][from.1] = true

        while !queue.isEmpty {
            let now = queue.removeFirst()
            if arr[now.x][now.y] == target {
                return now.dist
            }
            for d in 0..<4 {
                let nx = now.x + dx[d]
                let ny = now.y + dy[d]
                if nx >= 0 && nx < rowCount && ny >= 0 && ny < colCount &&
                    !visited[nx][ny] &&
                    arr[nx][ny] != "X" {
                    visited[nx][ny] = true
                    queue.append((nx, ny, now.dist + 1))
                }
            }
        }

        return -1
    }

    let toLever = bfs(from: start, target: "L")
    let toExit = bfs(from: lever, target: "E")
    
    if toLever == -1 || toExit == -1 {
        return -1
    }
    
    return toLever + toExit
}