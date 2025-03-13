let N = Int(readLine()!)!

var arr: [[Int]] = []

let dx = [0,0,-1,1]
let dy = [-1,1,0,0]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
var queue: [(Int,Int)] = []

var totalCnt = 0
var cntArr : [Int] = []
var cnt = 0

for _ in 0..<N{
    arr.append(readLine()!.map{Int(String($0))!})
}

for i in 0..<N{
    for j in 0..<N{
        if arr[i][j] == 1 && !visited[i][j]{
            (bfs(i,j))
            totalCnt+=1
            cntArr.append(cnt)
        }
        cnt = 0
    }
}
print(totalCnt)
cntArr.sort()
for i in 0..<cntArr.count{
   print(cntArr[i])
}

func bfs(_ y: Int, _ x: Int) {
    visited[y][x] = true
    queue.append((y,x))
    cnt+=1
    
    while !queue.isEmpty{
        let (currentY,currentX) = queue.removeFirst()
        for i in 0..<4{
            let newX = dx[i] + currentX
            let newY = dy[i] + currentY
            
            if newX < N && newY < N && newX >= 0 && newY >= 0 && !visited[newY][newX] && arr[newY][newX] == 1{
                visited[newY][newX] = true
                queue.append((newY,newX))
                cnt+=1
            }
        }
    }
}

