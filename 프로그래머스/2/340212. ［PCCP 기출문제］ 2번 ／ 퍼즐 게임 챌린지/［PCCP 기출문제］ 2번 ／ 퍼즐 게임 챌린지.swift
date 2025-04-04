import Foundation

func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    
    var start = 1
    var end = diffs.max()!
    var result = end
    
    while start <= end{
        let mid = (end+start)/2
        
        var totalTime = 0
        var time_prev = 0
        
        for i in 0..<diffs.count{
            if diffs[i] <= mid {
                totalTime += times[i]
            } else{
                totalTime += (times[i] + time_prev) * (diffs[i] - mid) + times[i]
            }
            time_prev = times[i]
        }
        
        if totalTime>limit{
            start = mid + 1
        }else{
            end = mid - 1
            result = mid
        }
    }
    
    return result
}