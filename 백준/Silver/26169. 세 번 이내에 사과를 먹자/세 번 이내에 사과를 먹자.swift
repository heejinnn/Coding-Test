import Foundation

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var arr = [[Int]]()

for _ in 0..<5 {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(line)
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let startX = input[0], startY = input[1]
var result = 0

dfs(x: startX, y: startY, count: 0, appleCount: arr[startX][startY] == 1 ? 1 : 0)
print(result >= 2 ? 1 : 0)

func dfs(x: Int, y: Int, count: Int, appleCount: Int){
    if count == 3 {
        result = max(result, appleCount)
        return
    }
    for i in 0..<4 {
        let mx = x + dx[i]
        let my = y + dy[i]
        
        if mx >= 0, mx < 5, my >= 0, my < 5, arr[mx][my] != -1 {
            let next = arr[mx][my]
            let curr = arr[x][y]
            var newAppleCount = appleCount
            
            arr[x][y] = -1
            
            if next == 1 {
                newAppleCount += 1
            }
          
            dfs(x: mx, y: my, count: count + 1, appleCount: newAppleCount)
            
            arr[x][y] = curr
        }
    }
    result = max(result, appleCount)
}