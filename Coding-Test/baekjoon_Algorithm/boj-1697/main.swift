let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (N,M) = (input[0], input[1])
var queue: [(Int, Int)] = []

var visited: [Bool] = Array(repeating: false, count: 100001)
var result = 0

bfs(N, 0)

func bfs(_ start: Int, _ cnt: Int) {
    queue.append((start, cnt))
    visited[start] = true

    while !queue.isEmpty {
        let (current, currentCnt) = queue.removeFirst()

        if current == M {
            result = currentCnt
            return
        }

        let nextValues = [current - 1, current + 1, current * 2]

        for next in nextValues {
            if next >= 0 && next <= 100000 && !visited[next] {
                queue.append((next, currentCnt + 1))
                visited[next] = true
            }
        }
    }
}
print(result)



