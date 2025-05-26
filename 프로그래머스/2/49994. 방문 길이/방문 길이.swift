import Foundation

func solution(_ dirs:String) -> Int {
    
    var visited = Set<String>()
    var start : (Int, Int) = (5,5)
    var result = 0
    
    for dir in dirs {
        
        var mx = start.0
        var my = start.1
        
        switch dir{
            case "U":
                mx += -1
            case "D":
                mx += 1
            case "R":
                my += 1
            case "L":
                my += -1
            default: 
                continue
        }
        
        if mx >= 0, mx <= 10, my >= 0, my <= 10{
            let path1 = "\(start.0),\(start.1)->\(mx),\(my)"
            let path2 = "\(mx),\(my)->\(start.0),\(start.1)"

            if !visited.contains(path1) && !visited.contains(path2) {
                visited.insert(path1)
                visited.insert(path2)
                result += 1
            }

            start = (mx, my)
        }
       
    }

    return result
}