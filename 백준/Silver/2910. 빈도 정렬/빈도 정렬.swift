
import Foundation

//"등장 횟수"와 "처음 등장한 위치"를 고려해서 정렬하기
// 1. 숫자별로 빈도수 저장하기
// 2. 빈도수에 따라서 정렬하기
// 2-1. 빈도수가 같다면, 먼저 나온 것이 앞에 오도록
// 2-2. 빈도수가 다르다면, 빈도수가 많은 것이 앞에 위치하도록


let input = readLine()!.split(separator: " ").map{Int($0)!}
let (N, C) = (input[0], input[1])

let arr = readLine()!.split(separator: " ").map{Int($0)!}

var freq = [Int: Int]()
var firstIndex = [Int: Int]()
for (i, num) in arr.enumerated(){
    freq[num, default: 0] += 1
    
    if firstIndex[num] == nil{
        firstIndex[num] = i
    }
}

let sorted = arr.sorted{
    if freq[$0]! != freq[$1]!{
        return freq[$0]! > freq[$1]!
    }else{
        return firstIndex[$0]! < firstIndex[$1]!
    }
}

for n in sorted{
    print(n, terminator: " ")
}

