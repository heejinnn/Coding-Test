let N = Int(readLine()!)!

var arr: [[Int]] = []
var white = 0
var blue = 0

for _ in 0..<N {
    var input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(input)
}
divide(0,0,N)

func divide(_ x: Int, _ y: Int, _ size: Int){
    if check(x, y, size){
        if arr[x][y] == 0{
            white += 1
        }
        else {
            blue += 1
        }
    }
    else {
        let sx = [ x, x, x + size/2, x + size/2 ]
        let sy = [y, y + size/2, y, y + size/2 ]
        
        for i in 0..<4{
            divide(sx[i], sy[i], size/2)
        }
    }
}

func check(_ x: Int, _ y: Int, _ size: Int) -> Bool{
    
    let color = arr[x][y]
    
    for i in x..<(x + size){
        for j in y..<(y + size){
            if arr[i][j] != color{
                return false
            }
        }
    }
    
    return true
}

print(white)
print(blue)