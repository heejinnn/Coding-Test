import Foundation

// 목적지 b로 가기위한 최단 경로 구하기
// 1. (next - current) % 징검다리 배수 == 0 인 경우만 이동할 수 있음

let n = Int(readLine()!)!

let arr = [0] + readLine()!.split(separator: " ").map({Int($0)!})
let line = readLine()!.split(separator: " ").map{Int($0)!}
let (a,b) = (line[0], line[1])

var queue: [(pos: Int, steps: Int)] = []
var visited: [Bool] = [Bool](repeating: false, count: n+1)

func bfs(start: Int) -> Int {
    queue.append((start, 0))
    visited[start] = true
    
    while !queue.isEmpty {
        let (current, steps) = queue.removeFirst()
        
        if current == b {
            return steps
        }
        
        for i in 1...n {
            if !visited[i] && abs(i - current) % arr[current] == 0 {
                visited[i] = true
                queue.append((i, steps + 1))
            }
        }
    }
    
    return -1
}

print(bfs(start: a))