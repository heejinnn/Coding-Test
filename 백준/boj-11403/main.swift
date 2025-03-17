let N = Int(readLine()!)!

var linkedList = [[Int]](repeating: [Int](), count: N)
var result = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }

    for j in 0..<input.count {
        if input[j] == 1 {
            linkedList[i].append(j)
        }
    }
}

for i in 0..<N {
    for j in 0..<N {
        result[i][j] = find(i, j, linkedList)
    }
}

func find(_ start: Int, _ end: Int, _ graph: [[Int]]) -> Int {
    var visited = [Bool](repeating: false, count: N)
    var queue = [Int]()

    queue.append(start)

    while !queue.isEmpty {
        let current = queue.removeFirst()

        for neighbor in graph[current] {
            if !visited[neighbor] {
                if neighbor == end {
                    return 1
                }

                queue.append(neighbor)
                visited[neighbor] = true
            }
        }
    }

    return 0
}

for i in 0..<N{
    for j in 0..<N{
        print((result[i][j]), terminator: " ")
    }
    print("")
}

