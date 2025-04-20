import Foundation

let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int($0)!}

let (start, finish) = (input[0], input[1])
let M = Int(readLine()!)!

var visited = Array(repeating: false, count: N+1)
var arr = Array(repeating: [Int]() , count: N + 1)
var result = 0

for _ in 1...M {
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    
    arr[line[0]].append(line[1])
    arr[line[1]].append(line[0])
}

dfs(start: start, count: 0)
print(result == 0 ? -1 : result)

func dfs(start: Int, count: Int){
    visited[start] = true
    if start == finish{
        result = count
        return
    }
    
    for i in arr[start]{
        if !visited[i]{
            dfs(start: i, count: count + 1)
        }
    }
}