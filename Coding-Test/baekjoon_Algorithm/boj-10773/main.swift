let count = Int(readLine()!)!
var stack: [Int] = []
var result = 0
for i in 0..<count {
    var number = Int(readLine()!)!
    if number == 0 {
        stack.removeLast()
    } else {
        stack.append(number)
    }
}


for i in stack {
    result += i
}
print(result)

