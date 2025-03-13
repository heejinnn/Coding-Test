
let N = Int(readLine()!)!
var arr = [[Int]](repeating: [Int](repeating: 0, count: 0), count: N + 1)

var result = [Int](repeating: 0, count: N+1)

for _ in 0..<N-1{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let a = input[0], b = input[1]
    arr[a].append(b)
    arr[b].append(a)
}
dfs(1)

func dfs(_ node: Int){
    for i in arr[node]{
        if result[i] == 0{
            result[i] = node
            dfs(i)
        }
    }
}
for i in 2..<N+1{
    print(result[i])
}



