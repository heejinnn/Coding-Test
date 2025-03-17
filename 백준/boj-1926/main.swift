let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (input[0], input[1])

var arr = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

var queue: [(Int, Int)] = []
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

var result: [Int] = []

for i in 0..<n{
    let inputArr = readLine()!.split(separator: " ").map{Int(String($0))!}
     
    for j in 0..<m{
        arr[i][j] = inputArr[j]
    }
}

for i in 0..<n{
    for j in 0..<m{
        if arr[i][j] == 1 && !visited[i][j]{
            bfs(i,j)
        }
    }
}

func bfs(_ x: Int, _ y: Int){
    var cnt = 1
    queue.append((x,y))
    visited[x][y] = true
    
    while !queue.isEmpty{
        let firstValue = queue.removeFirst()
        
        for i in 0..<4{
            let currentX = dx[i] + firstValue.0
            let currentY = dy[i] + firstValue.1
            
            if currentX >= 0 && currentX < n && currentY >= 0 && currentY < m && arr[currentX][currentY] == 1 && !visited[currentX][currentY]{
                visited[currentX][currentY] = true
                queue.append((currentX,currentY))
                cnt+=1
            }
        }
    }
    
    result.append(cnt)
}

print(result.count)

if result.count == 0{
    print(0)
}else{
    print(result.max()!)
}


