import Foundation
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (M,N) = (input[0], input[1])


var isPrimeNumber = [Bool](repeating: true, count: N + 1)
isPrimeNumber[1] = false

for i in 2..<Int(sqrt(Double(N)) + 1) {
    if isPrimeNumber[i] {
        var j = 2
        while i * j <= N {
            isPrimeNumber[i * j] = false
            j += 1
        }
    }
}

for i in M...N {
    if isPrimeNumber[i] {
        print(i)
    }
}

