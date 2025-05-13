import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var dict: [String:Int] = [:]
    var result = [String]()
    
        
    func dfs(_ length: Int, _ index: Int, _ path: [Character], _ order: [Character]) {
        if path.count == length {
            let combo = String(path)
            dict[combo, default: 0] += 1
            return
        }
        for i in index..<order.count {
            dfs(length, i + 1, path + [order[i]], order)
        }
    }
    
    for c in course {
        dict = [:]
        for order in orders{
            let sortedOrder = order.sorted()
            dfs(c, 0, [], sortedOrder)
        }
        
        let maxCount = dict.values.max() ?? 0
        
        if maxCount >= 2{
            let menu = dict.filter{$0.value == maxCount}
            result.append(contentsOf: menu.keys)
        }
    }

    
    return result.sorted()
}



