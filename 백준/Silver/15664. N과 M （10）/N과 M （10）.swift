
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (input[0], input[1])

var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var temp = [Int](repeating: 0, count: M)
var visited = [Bool](repeating: false, count: N)
var setResult = Set<[Int]>()

arr.sort()
find(0)

func find(_ depth: Int){
    
    if depth == M{
        if !setResult.contains(temp){
            setResult.insert(temp)
            for i in 0..<temp.count{
                print(temp[i], terminator: " ")
            }
            print()
        }
        
        return
    }
    
    for i in 0..<N{
        if visited[i] {continue}
        temp[depth] = arr[i]
        if depth == 0 {
            visited[i] = true
            find(depth+1)
            visited[i] = false
        }
        
        if depth > 0 && temp[depth-1] <= temp[depth]{
            visited[i] = true
            find(depth+1)
            visited[i] = false
        }
    }
}

