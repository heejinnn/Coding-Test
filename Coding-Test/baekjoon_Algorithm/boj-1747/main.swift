
import Foundation
var n = Int(readLine()!)!

while true{
    if isPrime(n){
        if isPalindrome(String(n).map{String($0)}){
            print(n)
            break
        }
    }
    n+=1
}

func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    let end: Int = Int(sqrt(Double(num)))
    for i in 2...end {
        if num % i == 0 {
            return false
        }
    }
    return true
}


func isPalindrome(_ arr: [String]) -> Bool {
    let length: Int = arr.count
    var flag: Bool = true

    for i in 0..<length/2 {
        if arr[i] != arr[length - 1 - i] {
            flag = false
            break
        }
    }
    return flag
}


