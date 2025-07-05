import Foundation

func isValid(_ a: [Character], _ b: [Character], shift: Int) -> Bool {
    for i in 0..<b.count {
        let j = i + shift
        if j >= 0 && j < a.count {
            if a[j] == "2" && b[i] == "2" {
                return false
            }
        }
    }
    return true
}

func minGearWidth(_ gearA: String, _ gearB: String) -> Int {
    let a = Array(gearA)
    let b = Array(gearB)
    
    let lenA = a.count
    let lenB = b.count
    var minWidth = lenA + lenB // 최대 길이로 초기화

    for shift in -lenB...lenA {
        if isValid(a, b, shift: shift) {
            let left = min(0, shift)
            let right = max(lenA, shift + lenB)
            let width = right - left
            minWidth = min(minWidth, width)
        }
    }
    return minWidth
}

let gearA = readLine()!
let gearB = readLine()!


print(minGearWidth(gearA, gearB))
