let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (input[0], input[1])

var A = [[Int]]()
var B = [[Int]]()

for _ in 0..<N {
    A.append(readLine()!.map { Int(String($0))! })
}

for _ in 0..<N {
    B.append(readLine()!.map { Int(String($0))! })
}

var result = 0

func find() {
    if input[0] < 3 || input[1] < 3 { return }
    
    for r in 0..<input[0]-2 {
        for c in 0..<input[1]-2 {
            if A[r][c] != B[r][c] {
                reverse(r, c)
                result += 1
            }
            
            if c == input[1]-3 {
                for i in input[1]-3..<input[1] {
                    if A[r][i] != B[r][i] { return }
                }
            }
        }
    }
    
}

func reverse(_ r: Int, _ c: Int) {
    for i in 0..<3 {
        for j in 0..<3 {
            A[r+i][c+j] = 1 - A[r+i][c+j]
        }
    }
}
find()
if A == B {
    print(result)
} else {
    print(-1)
}


