import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    let sum = brown + yellow
    var arr = [Int]()
    var arr2 = [Int]()
    var result = [Int]()
    
    for i in 3..<sum{
        if sum%i == 0{
            let row = i
            let col = sum/i
            if row >= col, col>2{
                arr.append(i)
            }
        }
    }
    
    if arr.count > 1{
        for i in 1...yellow{
            if yellow%i == 0{
                let row = i
                let col = yellow/i
                if row >= col, arr.contains(row+2){
                    arr2.append(i)
                }
            }
        }
        let row = arr2[0] + 2
        let col = (yellow/arr2[0]) + 2
        
        result.append(row)
        result.append(col)
        
    }else{
        let row = arr[0]
        let col = sum/arr[0]
        
        result.append(row)
        result.append(col)
    }
    
    return result
}