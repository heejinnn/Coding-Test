
let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n,m) = (input[0],input[1])

var arr = [Set<Int>]()
var result: [String] = []
var parent = [Int](0...n)

func find(_ x: Int) -> Int {
    if parent[x] == x {
        return x
    }
    parent[x] = find(parent[x])
    return parent[x]
}


func union(_ a: Int, _ b: Int) {
    let a = find(a)
    let b = find(b)
    
    if a == b {
        return
    }
    if a > b {
        parent[a] = b
    } else {
        parent[b] = a
    }
}

for _ in 0..<m {
    let operation = readLine()!.split(separator: " ").map { Int($0)! }
    let (isUnion,a,b) = (operation[0],operation[1],operation[2])
    if isUnion == 0 {
        union(a, b)
    } else {
        result.append(find(a) == find(b) ? "YES" : "NO")
    }
}

for i in 0..<result.count{
    print(result[i])
}


