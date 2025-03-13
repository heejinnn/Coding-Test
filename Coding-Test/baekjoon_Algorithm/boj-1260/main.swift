let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (N,M,V) = (input[0], input[1], input[2])

var arr = [[Int]](repeating: [Int](), count: N + 1)


for _ in 1..<M+1{
    let edge = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let a = edge[0]
    let b = edge[1]
    
    arr[a].append(b)
    arr[b].append(a)
}

for i in 1..<N+1 {
    arr[i].sort()
}

var dfsResult: [Int] = []
var bfsResult: [Int] = []

var queue: [Int] = []

var dfsvisited = [Bool](repeating: false, count: N+1)
var bfsvisited = [Bool](repeating: false, count: N+1)


func bfs(_ v: Int){
    queue.append(v)
    bfsResult.append(v)
    bfsvisited[v] = true
    
    while !queue.isEmpty{
        let currentNode = queue.removeFirst()
        
        for num in arr[currentNode]{
            if bfsvisited[num] {
                continue
            }
            queue.append(num)
            bfsResult.append(num)
            bfsvisited[num] = true
        }
    }
}

func dfs(_ v: Int){
    dfsResult.append(v)
    dfsvisited[v] = true
    
    for num in arr[v]{
        if !dfsvisited[num]{
            dfs(num)
        }
    }
}

dfs(V)
bfs(V)

for value in dfsResult {
    print(value, terminator: " ")
}
print("")

for value in bfsResult {
    print(value, terminator: " ")
}



