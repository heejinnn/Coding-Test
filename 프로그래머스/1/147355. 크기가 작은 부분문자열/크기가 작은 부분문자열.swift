import Foundation

func solution(_ t:String, _ p:String) -> Int {
    
    var start = 0
    var end = p.length
    var result = 0
    
    while true{
        if end > t.length{
            break
        }
        
        var startIndex = t.index(t.startIndex, offsetBy: start)
        var endIndex = t.index(t.startIndex, offsetBy: end)
        var num = t[startIndex ..< endIndex]
        
        if let tNum = Int(num), let pNum = Int(p){
            if tNum <= pNum{
                result += 1
            }
        }
        start += 1
        end += 1
    }
    
    return result
}