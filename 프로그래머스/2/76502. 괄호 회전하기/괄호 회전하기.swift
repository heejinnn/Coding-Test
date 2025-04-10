import Foundation

func solution(_ s: String) -> Int {
    let arr = Array(s)
    var count = 0

    for i in 0..<arr.count {
        let rotated = Array(arr[i...] + arr[..<i])
        if isValid(rotated) {
            count += 1
        }
    }


    return count
}

func isValid(_ chars: [Character]) -> Bool {
    var stack: [Character] = []

    for char in chars {
        if char == "(" || char == "[" || char == "{" {
            stack.append(char)
        } else if char == ")" {
            if stack.last == "(" {
                stack.removeLast()
            } else {
                return false
            }
        } else if char == "]" {
            if stack.last == "[" {
                stack.removeLast()
            } else {
                return false
            }
        } else if char == "}" {
            if stack.last == "{" {
                stack.removeLast()
            } else {
                return false
            }
        }
    }
    return stack.isEmpty
}
