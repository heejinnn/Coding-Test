
var N = 1
var caseNum = 0

while N != 0{
    N = Int(readLine()!)!
    var arr = [[String]](repeating: [String](), count: N)
    var visited = [Bool](repeating: false, count: N)
    var cnt = 0
    caseNum += 1
    
    for i in 0..<N{
        let input = readLine()!.split(separator: " ").map{String($0)}
        
        arr[i].append(contentsOf: input)
    }
    
    for i in 0..<N{
        let current = arr[i][0]
        var target = arr[i][1]
        
        if !visited[i]{
            
            while current != target{
                for j in 0..<N{
                    if !visited[j]{
                        if target == arr[j][0]{
                            target = arr[j][1]
                            visited[j] = true
                            continue
                        }
                    }
                }
            }

            cnt+=1
        }
    }
    if N != 0{
        print(caseNum, cnt)
    }
    
}
    




