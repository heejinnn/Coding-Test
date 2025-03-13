let N = Int(readLine()!)!
let recommedCnt = Int(readLine()!)!

var queue: [Int] = []
var cnt = [Int](repeating: 0, count: 101)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

for i in 0..<input.count {
    let student = input[i]
    cnt[student] += 1
    
    if queue.contains(student) {
        continue
    }

    if queue.count == N {
        var minIndex = 0
        for j in 1..<queue.count {
            if cnt[queue[j]] < cnt[queue[minIndex]]{
                minIndex = j
            }
        }

        let removeStudent = queue.remove(at: minIndex)
        cnt[removeStudent] = 0
    }

    queue.append(student)
}

let result = Set(queue).sorted()

for value in result {
    print(value, terminator: " ")
}



