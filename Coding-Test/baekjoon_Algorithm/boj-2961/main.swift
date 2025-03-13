
let N = Int(readLine()!)!

var arr : [[Int]] =  Array(repeating: Array(repeating: 0, count: 2), count: N)
var dp : [[Int]] =  Array(repeating: Array(repeating: 0, count: 2), count: N)

var result = Int.max

for i in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    arr[i][0] = input[0]
    arr[i][1] = input[1]
}

func dfs(_ cnt: Int, _ s: Int, _ b: Int){
    if cnt == N {
        if s == 1 && b == 0{
            return
        }
        else{
            result = min(result, abs(s-b))
            return
        }
    }
    dfs(cnt+1, s * arr[cnt][0], b + arr[cnt][1])
    dfs(cnt+1, s, b)
}

dfs(0,1,0)
print(result)


