import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let arr = readLine()!.map { String($0) }
    
    print(move(arr: arr))
    
}


func move(arr: [String]) -> Int{
    let dx = [0,0,-1,1]
    let dy = [1,-1,0,0]
    
    let directionL = [2,3,1,0]
    let directionR = [3,2,0,1]
    
    var maxX = 0
    var minX = 0
    var maxY = 0
    var minY = 0
    
    var direction = 0
    var current = [0, 0]
    var result = 0
    
    for str in arr{
        if str == "L"{
            direction = directionL[direction]
            
        } else if str == "R"{
            direction = directionR[direction]
        }
        
        if str == "F"{
            current[0] += dx[direction]
            current[1] += dy[direction]
        } else if str == "B"{
            current[0] -= dx[direction]
            current[1] -= dy[direction]
        }
        
        
        minX = min(minX, current[0])
        maxX = max(maxX, current[0])
        
        minY = min(minY, current[1])
        maxY = max(maxY, current[1])
        
    }
    
    result = (abs(maxX) + abs(minX)) * (abs(maxY) + abs(minY))
    
    return result
}
