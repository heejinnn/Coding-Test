import Foundation

func solution(_ elements:[Int]) -> Int {
    
    var sumSet = Set<Int>()
    var sum = 0
    
    for i in 0..<elements.count{
        sum = 0
        for j in 0..<elements.count{
            var index = i+j
            if index>=elements.count{
                index = index-elements.count
            }
            sum += elements[index]
            sumSet.insert(sum)
        }
    }
    
    return sumSet.count
}