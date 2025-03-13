
let N = Int(readLine()!)!

var arr : [[Int]] = []

for _ in 0..<N {
    let Input = Array(readLine()!).map {Int(String($0))!}
   
    arr.append(Input)
}

var result = ""

divide(0,0,N)

func divide (_ x:Int , _ y: Int, _ size: Int){
    
    if check(x, y, size){
        if arr[x][y] == 0{
            result = result + "0"
        }
        else{
            result = result + "1"
        }
        
    }
    else{
        let sx = [ x, x, x + size/2, x + size/2 ]
        let sy = [y, y + size/2, y, y + size/2 ]

        for i in 0..<4{
            divide(sx[i], sy[i], size/2)
        }
        result = result + ")"
    }
}

func check (_ x: Int, _ y: Int, _ size: Int) -> Bool{
    
    let color = arr[x][y]
    
    for i in x..<(x + size){
        for j in y..<(y + size){
            if arr[i][j] != color {
                result = result + "("
                return false
            }
        }
    }
    return true
}

print(result)

