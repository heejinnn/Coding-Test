let N = Int(readLine()!)!

var W = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)
var visited = [Bool](repeating: false, count: N+1)

for i in 1...N{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 1...N{
        W[i][j] = input[j-1]
    }
}

var result = Int.max
var sum = 0

find(1,1,0)

func find(_ now: Int, _ start: Int, _ depth: Int){
    if depth == N && now == start{
        result = min(result, sum)
        return
    }
    
    for i in 1...N{
        if !visited[i] && W[now][i]>0{
            visited[i] = true
            
            sum += W[now][i]
            if sum <= result{
                find(i, start, depth+1)
            }
            visited[i] = false
            sum -= W[now][i]
        }
    }
    
}

print(result)
