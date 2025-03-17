let N = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = [Int](repeating: 0, count: N)

for i in 0..<N {
    var cnt = 0
    for j in 0..<N {
        if cnt == arr[i] && result[j] == 0 {
            result[j] = i + 1
            break
        } else if result[j] == 0 {
            cnt += 1
        }
    }
}

print(result.map { String($0) }.joined(separator: " "))




