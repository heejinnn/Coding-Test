let N = Int(readLine()!)!

var lecture: [(Int, Bool)] = []
var result = 0
var current = 0

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let (s,t) = (input[0], input[1])
    
    lecture.append((s, true))
    lecture.append((t, false))
}

lecture.sort {
    if $0.0 == $1.0{
        return !$0.1
    } else {
        return $0.0 < $1.0
    }
}

for num in lecture {
    if num.1 {
        current += 1
        result = max(current, result)
    } else {
        current -= 1
    }
}

print(result)


