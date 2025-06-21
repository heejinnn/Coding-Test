import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    var sequence = [Double]()
    var current = Double(k)
    
    // 1. 우박수열 생성
    // 2. 사다리꼴 넓이 배열 생성
    // 3. 유효 범위 체크
    sequence.append(current)
    while current != 1 {
        if Int(current) % 2 == 0 {
            current /= 2
        } else {
            current = current * 3 + 1
        }
        sequence.append(current)
    }
    
    var areas = [Double]()
    for i in 0..<sequence.count - 1 {
        let area = (sequence[i] + sequence[i + 1]) / 2.0
        areas.append(area)
    }
    
    let totalLength = areas.count
    var result = [Double]()
    
    for range in ranges {
        let a = range[0]
        let b = range[1]
        let end = totalLength + b 
        
        if a > end || a < 0 || end > totalLength {
            result.append(-1.0)
        } else {
            let sum = areas[a..<end].reduce(0, +)
            result.append(sum)
        }
    }

    return result
}
