let N = Int(readLine()!)!

var start: [String] = []
var end: [String] = []

for i in 0..<2*N{
    let input = readLine()!
    
    if i < N{
        start.append(input)
    }else{
        end.append(input)
    }
}

var current = 0
var cnt = 0

for i in 0..<N{
    for j in current..<N{
        if start[i] == end[j]{
            current = j
            cnt += 1
        }
    }
}

print(N-cnt)

