let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (input[0], input[1])

var arr = [[Int]](repeating: [Int]() ,count: N)
var resultArr = [[Int]](repeating: [Int](repeating: 0,count: M),count: N)

for i in 0..<N{
    let inputNum = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    arr[i].append(contentsOf: inputNum)
}

let K = Int(readLine()!)!

for i in 0..<N{
    var cnt = 0
    for j in 0..<M{
        cnt += arr[i][j]
        if i>0 {
            resultArr[i][j] = resultArr[i-1][j] + cnt
        }else{
            resultArr[i][j] = cnt
        }
    }
}


for _ in 0..<K{
    let kArr = readLine()!.split(separator: " ").map{Int(String($0))!}

    let (x1, y1) = (kArr[0] - 1, kArr[1] - 1)
    let (x2, y2) = (kArr[2] - 1, kArr[3] - 1)
    
    if x1 == 0, y1 == 0{
        print(resultArr[x2][y2])
    }else if x1 == 0 {
        print(resultArr[x2][y2] - resultArr[x2][y1-1])
    }else if y1 == 0{
        print(resultArr[x2][y2] - resultArr[x1-1][y2])
    }
    else{
        print(resultArr[x2][y2] - resultArr[x1-1][y2] - resultArr[x2][y1-1] + resultArr[x1-1][y1-1])
    }
}






