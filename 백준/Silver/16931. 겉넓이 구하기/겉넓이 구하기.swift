import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

var square: [[Int]] = []

for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    square.append(row)
}

var side1 = 0 // 왼쪽+오른쪽
var side2 = 0 // 앞+뒤
let side3 = N * M // 위+아래

for i in 0..<N {
    for j in 0..<M {
        if j == 0 {
            side1 += square[i][j]
        } else {
            if square[i][j] > square[i][j - 1] {
                side1 += square[i][j] - square[i][j - 1]
            }
        }
    }
}

for j in 0..<M {
    for i in 0..<N {
        if i == 0 {
            side2 += square[i][j]
        } else {
            if square[i][j] > square[i - 1][j] {
                side2 += square[i][j] - square[i - 1][j]
            }
        }
    }
}


let result = (side1 + side2 + side3) * 2
print(result)
