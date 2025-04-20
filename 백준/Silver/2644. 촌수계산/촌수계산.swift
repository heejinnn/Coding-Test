let n = Int(readLine()!)!

let relation = readLine()!.split(separator: " ").map{Int(String($0))!}

let (start, finish) = (relation[0],relation[1])
let m = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](), count: n+1)
var visited = [Bool](repeating: false, count: n+1)

var result = 0

for _ in 0..<m{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let (x,y) = (input[0], input[1])
    
    arr[x].append(y)
    arr[y].append(x)
}
var isSuccess = false

func dfs(_ start: Int, _ cnt: Int) {
  visited[start] = true
  if start == finish {
    result = cnt
    return
  }
  
  for i in arr[start] {
    if !visited[i] {
      dfs(i, cnt + 1)
    }
  }
}

dfs(start, 0)
print(result == 0 ? -1 : result)




