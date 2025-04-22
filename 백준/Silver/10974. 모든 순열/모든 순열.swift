import Foundation

let N = Int(readLine()!)!
var arr: [Int] = []

for  i in 1...N{
    arr.append(i)
}

var visited = Array(repeating: false, count: arr.count)
var output = Array(repeating: 0, count: arr.count)

dfs(depth: 0)

func dfs(depth: Int){
    if depth == N{
        for n in output{
            print(n, terminator: " ")
        }
        print()
        return
    }
    for i in 0..<arr.count{
        if !visited[i]{
            visited[i] = true
            output[depth] = arr[i]
            dfs(depth: depth + 1)
            visited[i] = false
        }
    }
}