let N = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](repeating: 0, count: 2), count: N)

for i in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    arr[i][0] = input[0]
    arr[i][1] = input[1]
    
}

arr.sort {
    if $0[1] == $1[1]{
        return $0[0] < $1[0]
    } else {
        return $0[1] < $1[1]
    }
}

var result = 0
var current = 0
for i in 0..<N{
    let begin = arr[i][0]
    let end = arr[i][1]
    
    if current <= begin{
        current = end
        result += 1
    }else{
        continue
    }
}

print(result)

