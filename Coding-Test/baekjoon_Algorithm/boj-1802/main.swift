let T = Int(readLine()!)!

var paper: [Int] = []

for _ in 0..<T {
    paper = readLine()!.map { Int(String($0))! }
   
    if paper.count > 1 {
        if find(0, paper.count - 1) {
            print("YES")
        } else {
            print("NO")
        }
    } else {
        print("YES")
    }
}

func find(_ start: Int, _ end: Int) -> Bool {
    if start >= end {
        return true
    }
    
    let mid = (start + end) / 2
    
    for i in start..<mid {
        if paper[i] == paper[end - i] {
            return false
        }
    }
    
    return find(start, mid - 1) && find(mid + 1, end)
}


