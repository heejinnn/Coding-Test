import Foundation
func solution(_ sequence: [Int], _ k: Int) -> [Int] {
                                                
    var start = 0
    var end = 0
    var sum = sequence[0]
    var gap = Int.max
    var result = Array(repeating: 0, count: 2)
    
    while start < sequence.count && end < sequence.count{
        
        if sum < k{
            end+=1
            if end < sequence.count {
                sum += sequence[end]
            }
        } else if sum > k{
            sum -= sequence[start]
            start += 1
        } else{
            if end - start < gap{
                gap = end - start
                result[0] = start
                result[1] = end
            }
            sum -= sequence[start]
            start += 1
        }
    }

    return result
}