import Foundation

func bfs(_ A: Int, _ K: Int) {
    var queue: [Int] = [A]
    var visited = [Bool](repeating: false, count: K + 2)
    visited[A] = true

    var count = 0
    var front = 0

    while front < queue.count {
        let size = queue.count - front

        for _ in 0..<size {
            let current = queue[front]
            front += 1

            if current == K {
                print(count)
                return
            }

            let next1 = current + 1
            let next2 = current * 2

            if next1 <= K && !visited[next1] {
                visited[next1] = true
                queue.append(next1)
            }

            if next2 <= K && !visited[next2] {
                visited[next2] = true
                queue.append(next2)
            }
        }
        count += 1
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let A = input[0], K = input[1]
bfs(A, K)
