import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var priorities = priorities
    var dict: [Int: Int] = [:]
    var queue = [Int]()
    var index = 0
    
    for i in 0..<priorities.count{
        dict[i] = priorities[i]
        queue.append(i)
    }

    while !queue.isEmpty{
        let first = queue.removeFirst()
        let currentPriority = dict[first]!
        let maxPriority = queue.map { dict[$0]! }.max() ?? currentPriority
        
        if let value = dict[first]{
            
            if currentPriority < maxPriority{
                queue.append(first)
               
            }else{
                index += 1
                if first == location {
                    return index
                }
            }
        }
    }

    return 0
}