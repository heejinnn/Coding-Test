import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var arr = Array(1...n)
    var roundArr = [Int]()
    var num = n
    var isFinished = false

    while num > 1 && !isFinished {
        for i in stride(from: 0, to: num - 1, by: 2) {
            let n1 = arr[i]
            let n2 = arr[i + 1]

            if (n1 == a && n2 == b) || (n1 == b && n2 == a) {
                answer += 1
                isFinished = true
                break
            } else if n1 == a || n2 == a {
                roundArr.append(a)
            } else if n1 == b || n2 == b {
                roundArr.append(b)
            } else {
                roundArr.append(n1)
            }
        }

        if !isFinished { 
            answer += 1
            num = roundArr.count
            arr = roundArr
            roundArr.removeAll()
        }
    }
    return answer
}