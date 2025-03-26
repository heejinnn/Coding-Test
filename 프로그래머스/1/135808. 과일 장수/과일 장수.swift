import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    
    let sortedScore = score.sorted(by: >)
    var arr = [Int]()
    var result = 0
    var count = 0
    
    if m <= score.count{
        while count < sortedScore.count{
            if arr.count < m {
                arr.append(sortedScore[count])
                count += 1
            } else {
                result += arr[m-1] * m
                arr.removeAll()
            }
        }
        if arr.count == m{
            result += arr[m-1] * m
        }
    }
    
    return result
}