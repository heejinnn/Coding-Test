import Foundation

func solve(_ a: Int, _ b: Int, _ c: Int) {
    var queue: [(Int, Int, Int)] = []
    var ans: [Int] = []

    queue.append((0, 0, c))

    while !queue.isEmpty {
        let (at, bt, ct) = queue.removeFirst()

        if visited[at][bt][ct] {
            continue
        }
        visited[at][bt][ct] = true

        if at == 0 {
            ans.append(ct)
        }

        // a -> b
        if at + bt > a {
            queue.append((a, at + bt - a, ct))
        } else {
            queue.append((at + bt, 0, ct))
        }

        if at + bt > b {
            queue.append((at + bt - b, b, ct))
        } else {
            queue.append((0, at + bt, ct))
        }

        // a -> c
        if at + ct > a {
            queue.append((a, bt, at + ct - a))
        } else {
            queue.append((at + ct, bt, 0))
        }

        if at + ct > c {
            queue.append((at + ct - c, bt, c))
        } else {
            queue.append((0, bt, at + ct))
        }

        // b -> c
        if bt + ct > b {
            queue.append((at, b, bt + ct - b))
        } else {
            queue.append((at, bt + ct, 0))
        }

        if bt + ct > c {
            queue.append((at, bt + ct - c, c))
        } else {
            queue.append((at, 0, bt + ct))
        }
    }

    ans.sort()
    for i in ans {
        print(i, terminator: " ")
    }
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (A,B,C) = (input[0], input[1], input[2])
var volume = Set<Int>()
var visited: [[[Bool]]] = []

visited = Array(repeating: Array(repeating: Array(repeating: false, count: C + 1), count: B + 1), count: A + 1)
solve(A, B, C)



