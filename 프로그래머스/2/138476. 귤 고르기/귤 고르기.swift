import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    
    let maxVal = tangerine.max()!
    var arr = Array(repeating: 0, count: maxVal + 1)
    var result = [Int]()
    var count = k
    
    for i in 0..<tangerine.count{
        arr[tangerine[i]] += 1
    }
    
    var resultArr = arr.sorted(by: >)
    
    for i in 0..<resultArr.count{
        while resultArr[i] != 0, count != 0{
            resultArr[i] -= 1
            count -= 1
        }
        result.append(i)
        if count == 0 {   
             break
        }
    }
    
    return result.count
}