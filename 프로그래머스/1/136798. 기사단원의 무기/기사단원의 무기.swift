import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {

    var result = 0
    
    for n in 1...number{
        
        let count = divisorCount(n: n, limit: limit)
        
        if count > limit{
            result += power
        } else{
            result += count
        }
    }
                                            
    return result
}

func divisorCount(n: Int, limit: Int) -> Int{
    var count = 0
    var num = Int(sqrt(Double(n)))
    for i in 1...num{
        if n%i == 0{
            count += 2
        }
    }
    
    if num * num == n {
        count -= 1
    }
    
    return count
}