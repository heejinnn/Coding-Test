import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

var colors = [Int]()
for _ in 0..<M {
    colors.append(Int(readLine()!)!)
}

var left = 1
var right = colors.max()!

while left <= right {
    let mid = (left + right) / 2
    var total = 0

    for color in colors {
        if color % mid == 0 {
            total += color / mid
        } else {
            total += (color / mid) + 1
        }
    }

    if total > N {
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(left)


