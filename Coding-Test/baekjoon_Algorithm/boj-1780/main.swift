let N = Int(readLine()!)!

var arr: [[Int]] = []
var result = [Int](repeating: 0 , count: 3)//-1,0,1

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append(input)
}

find(0,0,N)

func find(_ y: Int, _ x: Int,  _ length: Int){
    let paper = arr[y][x]

    if length < 0{
        return
    }
    
    for i in y..<y+length{
        for j in x..<x+length{
            if arr[i][j] != paper{
                find(y, x, length/3)
                find(y, x + length/3 , length/3)
                find(y, x + (length/3) * 2, length/3)
                find(y + length/3, x, length/3)
                find(y + length/3, x + length/3, length/3)
                find(y + length/3, x + (length/3) * 2, length/3)
                find(y + (length/3) * 2, x,  length/3)
                find(y + (length/3) * 2, x + length/3 , length/3)
                find(y + (length/3) * 2, x + (length/3) * 2,length/3)
                return
            }
        }
    }
    
    if paper == -1{
        result[0] += 1
    }else if paper == 0 {
        result[1] += 1
    }else{
        result[2] += 1
        
    }
}
for i in 0..<result.count{
    print(result[i])
}



