let input = readLine()!.split(separator: " ").map{Int(String($0))!}



let (A,B,N,M) = (input[0], input[1], input[2], input[3])
let moveArr = [1,-1,A,B,-A,-B,A,B]

var queue: [Int] = []
var visited = [Bool](repeating: false, count: 100001)
var cntArr = [Int](repeating: 0, count: 100001)


queue.append(N)
visited[N] = true

while !queue.isEmpty{
    let value = queue.removeFirst()
    
    if value == M{
        print(cntArr[value])
        break
    }
    
    for i in 0..<8{
        if i<6{
            let next = value + moveArr[i]
            if next >= 0, next <= 100000,!visited[next]{
                queue.append(next)
                visited[next] = true
                cntArr[next] += cntArr[value] + 1
            }
        }else{
            let next = value * moveArr[i]
            if next >= 0, next <= 100000, !visited[next]{
                queue.append(next)
                visited[next] = true
                cntArr[next] += cntArr[value] + 1
            }
        }
    }
}




