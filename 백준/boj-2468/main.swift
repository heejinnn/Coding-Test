let N = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](), count: N)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: N),count: N)
var queue: [(Int,Int)] = []

var result = 0

let dx = [-1,1,0,0]
let dy = [0,0,1,-1]

for i in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i].append(contentsOf: input)
}



for rain in 1...100{
    var cnt = 0
    for i in 0..<N{
        for j in 0..<N{
            if arr[i][j] == rain{
                arr[i][j] = -1
            }
        }
    }
    visited = [[Bool]](repeating: [Bool](repeating: false, count: N),count: N)
    for i in 0..<N{
        for j in 0..<N{
            if arr[i][j] != -1, !visited[i][j]{
                cnt+=1
                bfs(i,j)
            }
        }
    }
    result = max(result, cnt)
}

func bfs(_ x: Int, _ y: Int){
    visited[x][y] = true
    queue.append((x,y))
    
    while !queue.isEmpty{
        let current = queue.removeFirst()
        
        for i in 0..<4{
            let mx = current.0 + dx[i]
            let my = current.1 + dy[i]
            
            if mx >= 0, mx < N, my >= 0, my < N, !visited[mx][my], arr[mx][my] != -1{
                visited[mx][my] = true
                queue.append((mx,my))
            }
        }
    }
}

print(result == 0 ? 1 : result)



