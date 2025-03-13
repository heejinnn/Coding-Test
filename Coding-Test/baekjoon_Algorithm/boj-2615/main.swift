import Foundation

var arr = [[Int]](repeating: [Int](), count: 19)

let dx = [0, 1, 1, -1]
let dy = [1, 0, 1, 1]


func find(_ x: Int, _ y: Int) {
    let color = arr[x][y]

    for k in 0..<4 {
        var cnt = 1
        var nx = x + dx[k]
        var ny = y + dy[k]

        while nx >= 0, nx < 19, ny >= 0, ny < 19, arr[nx][ny] == color {
            cnt += 1

            if cnt == 5 {
                if x - dx[k] >= 0,  x - dx[k] < 19, y - dy[k] >= 0, y - dy[k] < 19, arr[x - dx[k]][y - dy[k]] == color {
                    break
                }
                if nx + dx[k] >= 0, nx + dx[k] < 19, ny + dy[k] >= 0, ny + dy[k] < 19, arr[nx + dx[k]][ny + dy[k]] == color {
                    break
                }

                print(color)
                print(x + 1, y + 1)
                exit(0)
            }

            nx += dx[k]
            ny += dy[k]
        }
    }
}

for i in 0..<19 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr[i].append(contentsOf: input)
}

for i in 0..<19 {
    for j in 0..<19 {
        if arr[i][j] != 0 {
            find(i, j)
        }
    }
}

print(0)


