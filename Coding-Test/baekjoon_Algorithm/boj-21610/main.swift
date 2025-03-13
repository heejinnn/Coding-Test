let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (N,M) = (input[0], input[1])

var arr = [[Int]](repeating: [Int](), count: N)
var move = [[Int]](repeating: [Int](repeating: 0, count: 2), count: M)

var dx = [0,-1,-1,-1,0,1,1,1]
var dy = [-1,-1,0,1,1,1,0,-1]

var clouds: [(Int,Int)] = []

for i in 0..<N{
    let arrInput = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i].append(contentsOf: arrInput)
}

for i in 0..<M{
    let moveInput = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    move[i][0] = moveInput[0] - 1
    move[i][1] = moveInput[1]
}

//초기 세팅
clouds.append((N-1,0))
clouds.append((N-1,1))
clouds.append((N-2,0))
clouds.append((N-2,1))

for i in 0..<M{
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    let direction = move[i][0]
    let distance  = move[i][1]
    
    //구름 위치 이동
    for i in 0..<clouds.count{
        
        clouds[i].0 += (dx[direction]*distance)%N
        clouds[i].1 += (dy[direction]*distance)%N
        
        if clouds[i].0 < 0{
            clouds[i].0 += N
        }else if clouds[i].0 >= N{
            clouds[i].0 -= N
        }
        if clouds[i].1 < 0{
            clouds[i].1 += N
        }else if clouds[i].1 >= N{
            clouds[i].1 -= N
        }
        
        let mx = clouds[i].0
        let my = clouds[i].1
        
        arr[mx][my] += 1//구름 비
        visited[mx][my] = true
    }

    //대각선 판단
    while !clouds.isEmpty{
        let current = clouds.removeFirst()
        for i in stride(from: 1, to: 8, by: 2){
            let findX = current.0 + dx[i]
            let findY = current.1 + dy[i]
            
            if findX >= 0 , findX < N, findY >= 0 , findY < N, arr[findX][findY] != 0{
                arr[current.0][current.1] += 1
            }
        }
    }

    //구름 생성
    for i in 0..<N{
        for j in 0..<N{
            if arr[i][j] >= 2, !visited[i][j]{
                arr[i][j] -= 2
                clouds.append((i,j))
            }
        }
    }
}

var result = 0

for i in 0..<N{
    for j in 0..<N{
        result += arr[i][j]
    }
}
print(result)


