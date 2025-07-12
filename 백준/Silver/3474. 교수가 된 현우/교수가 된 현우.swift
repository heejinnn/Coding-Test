
import Foundation

//N!의 오른쪽 끝의 0의 개수 구하기
//=> 끝자리가 0이 되는 경우는 10밖에 없다. 즉 2*5=10
//팩토리얼에는 2가 더 많이 등장해서 5의 개수만 구하면 된다.
//1. N!에 있는 5의 개수를 모두 더하기


let T = Int(readLine()!)!

for _ in 0..<T{
    let N = Int(readLine()!)!
    var count = 0
    var divisor = 5

    while N / divisor > 0 {
        count += N / divisor
        divisor *= 5
    }
    print(count)
}
