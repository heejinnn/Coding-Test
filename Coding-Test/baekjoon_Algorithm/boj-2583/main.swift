import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (M, N, K) = (input[0], input[1], input[2])
var arr = [[Int]](repeating: [Int](repeating: 0, count: N), count: M)
var queue: [(Int,Int)] = []
var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

var result: [Int] = []

for _ in 0..<K{
    let square = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let (startDy , startDx) = (square[0], square[1])
    let (endDy , endDx) = (square[2], square[3])
    
    for i in startDx..<endDx {
        for j in startDy..<endDy {
            arr[i][j] = 1
        }
    }
}

for i in 0..<M{
    for j in 0..<N{
        if !visited[i][j] && arr[i][j] != 1{
            bfs(i,j)
        }
    }
}

func bfs(_ x: Int, _ y: Int){
    visited[x][y] = true
    queue.append((x,y))
    var cnt = 1
    
    while !queue.isEmpty{
        let (currentX,currentY) = queue.removeFirst()
        
        for i in 0..<4{
            let newY = currentY + dy[i]
            let newX = currentX + dx[i]
            
            if newY >= 0 && newY < N && newX >= 0 && newX < M && !visited[newX][newY] && arr[newX][newY] != 1 {
                cnt+=1
                visited[newX][newY] = true
                queue.append((newX, newY))
            }
        }
    }
    result.append(cnt)
}

result.sort()
print(result.count)
for i in 0..<result.count{
    print(result[i], terminator: " ")
}



