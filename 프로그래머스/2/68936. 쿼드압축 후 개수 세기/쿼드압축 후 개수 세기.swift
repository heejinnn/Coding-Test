import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    
    let count = arr[0].count
    var result = Array(repeating: 0, count: 2)
    
    func find(_ startX: Int, _ startY: Int, _ length: Int) {
        let current = arr[startX][startY]
        var same = true

        for i in startX..<startX+length {
            for j in startY..<startY+length {
                if arr[i][j] != current {
                    same = false
                    break
                }
            }
            if !same { break }
        }

        if same {
            result[current] += 1
        } else {
            let half = length / 2
            find(startX, startY, half)
            find(startX, startY + half, half)
            find(startX + half, startY, half)
            find(startX + half, startY + half, half)
        }
    }

    find(0, 0, count)

    return result
}