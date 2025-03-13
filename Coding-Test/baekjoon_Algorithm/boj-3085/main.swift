let N = Int(readLine()!)!

var arr : [[String]] = []

var maxValue = 0

for _ in 0..<N {
    let Input = Array(readLine()!).map {String($0)}

    arr.append(Input)
}

for i in 0..<N{
    for j in 0..<N-1{
        var swap = arr[i][j]
        arr[i][j] = arr[i][j+1]
        arr[i][j+1] = swap
        
        search()
        swap = arr[i][j]
        arr[i][j] = arr[i][j+1]
        arr[i][j+1] = swap
    }
}
for i in 0..<N{
    for j in 0..<N-1{
        var swap = arr[j][i]
        arr[j][i] = arr[j+1][i]
        arr[j+1][i] = swap
        
        search()
        swap = arr[j][i]
        arr[j][i] = arr[j+1][i]
        arr[j+1][i] = swap
    }
}


func search(){
    for i in 0..<N{
        var cnt = 1
        for j in 0..<N-1{
            if(arr[i][j] == arr[i][j+1]){
                cnt+=1
            }
            else{
                cnt = 1
            }
            maxValue = max(maxValue, cnt)
                
        }
    }
    
    for i in 0..<N{
        var cnt = 1
        for j in 0..<N-1{
            if(arr[j][i] == arr[j+1][i]){
                cnt+=1
            }
            else{
                cnt = 1
            }
            maxValue = max(maxValue, cnt)
                
        }
    }
}

print(maxValue)

