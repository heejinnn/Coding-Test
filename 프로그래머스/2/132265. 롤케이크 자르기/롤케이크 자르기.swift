import Foundation

func solution(_ topping: [Int]) -> Int {
    let n = topping.count
    var result = 0
    
    var leftSet = Set<Int>()
    var rightCounter = [Int: Int]()
    var rightSet = Set<Int>()
    
    for t in topping {
        rightCounter[t, default: 0] += 1
        rightSet.insert(t)
    }
    print(rightCounter)

    for i in 0..<n {
        let current = topping[i]
        
        leftSet.insert(current)
        
        rightCounter[current]! -= 1
        if rightCounter[current]! == 0 {
            rightSet.remove(current)
        }
        
        if leftSet.count == rightSet.count {
            result += 1
        }
    }
    return result
}