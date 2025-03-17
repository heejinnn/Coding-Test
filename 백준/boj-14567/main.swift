let input = readLine()!.split(separator: " ").map { Int($0)! }

let (N, M) = (input[0], input[1])

var arr = [[Int]](repeating: [Int](), count: N + 1)
var result = [Int](repeating: 0, count: N + 1)
var inDegree = [Int](repeating: 0, count: N + 1)
var queue: [Int] = []

for _ in 0..<M {
    let subjectArr = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (subjectArr[0], subjectArr[1])
    arr[a].append(b)
    inDegree[b] += 1
}

for i in 1...N {
    if inDegree[i] == 0 {
        queue.append(i)
        result[i] = 1
    }
}

while !queue.isEmpty {
    let node = queue.removeFirst()
    for next in arr[node] {
        inDegree[next] -= 1
        if inDegree[next] == 0 {
            queue.append(next)
            result[next] = result[node] + 1
        }
    }
}

for i in 1...N {
    print(result[i], terminator: " ")
}

