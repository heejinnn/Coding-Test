import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    
    var scoreArr = [Int]()
    var result = [Int]()
    
    for num in score{
        scoreArr.append(num)
        scoreArr.sort(by: >)
        if scoreArr.count > k {
            scoreArr.removeLast() 
        }
        let min = scoreArr.min()!
        result.append(min)
    }
    
    return result
}