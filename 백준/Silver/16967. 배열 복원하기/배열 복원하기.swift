import Foundation
let input = readLine()!.split(separator: " ").map{Int($0)!}

let (H, W, X, Y) = (input[0], input[1], input[2], input[3])
var arrB = Array(repeating: [Int](), count: H+X)
var arrA = Array(repeating: [Int](), count: H)

for i in 0..<H+X{
    let line = readLine()!.split(separator: " ").map{Int($0)!}

    arrB[i].append(contentsOf: line)
}

for i in X..<H+X{
    for j in Y..<W+Y{
        arrB[i][j] =  arrB[i][j] - arrB[i-X][j-Y]
    }
}

for i in 0..<H{
    for j in 0..<W{
        print(arrB[i][j], terminator: " ")
    }
    print()
}
