import Foundation

//M개의 문자열 주에서 집합 S에 포함되어 있는 것이 총 몇개인지
//1. 집합 S에 포함되어 있는지 확인
//2. 포함되어 있다면 집합 S에서 제거하고, 카운트 증가


let input = readLine()!.split(separator: " ").map{Int($0)!}

let (N,M) = (input[0], input[1])

var S = Set<String>()
var result = 0

for _ in 0..<N{
    S.insert(String(readLine()!))
}

for _ in 0..<M{
    let word = String(readLine()!)
    
    if S.contains(word) {
        result += 1
    }
}

print(result)
