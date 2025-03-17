import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var (N, M) = (input[0], input[1])
var cmd: [[Int]] = []
var arr = [Int](repeating: 0, count: N+1)

for _ in 0..<M {
    var cmdValue = readLine()!.split(separator: " ").map { Int(String($0))! }
    cmd.append(cmdValue)
}

for i in 0..<cmd.count {
    var x: Int = -1
    
    if cmd[i][0] == 1{
        x += cmd[i][2]
        arr[cmd[i][1]] |= (1<<x)

    }
    if cmd[i][0] == 2{
        x += cmd[i][2]
       arr[cmd[i][1]] &= ~(1<<x)
    }
    if cmd[i][0] == 3{
        arr[cmd[i][1]] = (arr[cmd[i][1]] & ~(1<<19)) << 1
    }
    if cmd[i][0] == 4{
        arr[cmd[i][1]] = (arr[cmd[i][1]] & ~(1<<0)) >> 1
    }
}

var check = Set<Int>()

for i in 1..<N+1 {
    check.insert(arr[i])
}
print(check.count)

    





