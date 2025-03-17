let T = Int(readLine()!)!

var (M,N,K) = (0,0,0)

var arr: [[Int]] = []
var visited: [[Bool]] = []

let dx = [0,0,-1,1]
let dy = [-1,1,0,0]
var stack: [(Int,Int)] = []

for t in 0..<T{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}

    (M,N,K) = (input[0],input[1],input[2])

    arr = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

    var cntArr = [Int](repeating: 0, count: T)

    for _ in 0..<K{
        let cabbage = readLine()!.split(separator: " ").map{Int(String($0))!}
        
        arr[cabbage[1]][cabbage[0]] = 1
    }

    for y in 0..<N {
        for x in 0..<M{
            if arr[y][x] == 1 && !visited[y][x]{
                bfs(y,x)
                
                cntArr[t] += 1
            }
        }
    }
    print(cntArr[t])
}

func bfs(_ y:Int, _ x: Int){
    visited[y][x] = true
    stack.append((y, x))
    
    while !stack.isEmpty{
        let (currentY,currentX) = stack.removeFirst()
        
        for i in 0..<4{
            let newY = currentY + dy[i]
            let newX = currentX + dx[i]
            
            if newY >= 0 && newY < N && newX >= 0 && newX < M && !visited[newY][newX] && arr[newY][newX] == 1 {
                visited[newY][newX] = true
                stack.append((newY, newX))
            }
        }
    }
}
