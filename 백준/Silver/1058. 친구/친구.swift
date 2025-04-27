let N = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](), count: N)
var resultArr = [[Int]](repeating: [Int](), count: N)
var queue = [Int]()
var result = 0

for i in 0..<N{
    let input = readLine()!.map{String($0)}
    
    for (index, bool) in input.enumerated(){
        if bool == "Y"{
            arr[i].append(index)
            resultArr[i].append(index)
        }
    }
}

for i in 0..<N{
    for j in 0..<arr[i].count{
        if arr[i][j] != i{
            dfs(arr[i][j], i)
        }
    }
}
func dfs(_ n: Int, _ start: Int){
    queue.append(n)
    
    while !queue.isEmpty{
        let remove = queue.removeFirst()
        for i in 0..<arr[remove].count{
            if arr[remove][i] != start{
                resultArr[start].append(arr[remove][i])
            }
        }
    }
    let setArr: Set = Set(resultArr[start])
    
    result = max(result, setArr.count)
}
print(result)
