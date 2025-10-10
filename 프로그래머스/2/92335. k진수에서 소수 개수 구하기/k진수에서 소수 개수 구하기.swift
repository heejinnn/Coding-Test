import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let radixVal = String(n, radix: k)
    let arr = radixVal.split(separator: "0").map { Int64($0)! }
    var result = 0
    
    for num in arr {
        if isPrime(num) {
            result += 1
        }
    }
    
    return result
}

func isPrime(_ n: Int64) -> Bool {
    if n < 2 { return false }
    if n == 2 || n == 3 { return true }
    
    for i in 2...Int64(sqrt(Double(n))) {
        if n % i == 0 { return false }
    }
    return true
}