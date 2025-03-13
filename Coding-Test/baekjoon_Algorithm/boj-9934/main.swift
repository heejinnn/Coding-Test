import Foundation

let K = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var graph: [Int] = []
var result = Array(repeating: [Int](), count: K)

for n in input{
    graph.append(n)
}

var visited = [Bool](repeating: false, count: graph.count)

func find(_ left: Int, _ right: Int, _ level: Int){
    if left>right{ return }
    
    let mid = (left+right)/2
    
    result[level].append(graph[mid])
    find(left, mid-1, level+1)
    find(mid+1, right, level+1)
}

find(0, graph.count-1, 0)

for i in 0..<K{
    for v in result[i]{
        print(v, terminator: " ")
    }
    print()
}



