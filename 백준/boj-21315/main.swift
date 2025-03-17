import Foundation

let n = Int(readLine()!)!
let L = readLine()!.split(separator: " ").map { Int($0)! }

func shuffle(_ cardList: [Int], _ index: Int) -> [Int] {
    if index == 0 {
        return cardList
    }
    let divideCardList = Array(cardList.suffix(from: cardList.count - index))
    return shuffle(divideCardList, index / 2) + Array(cardList.prefix(cardList.count - index))
}


var result = [(Int, Int)]()
let M = Int(log2(Double(n)))

for k1 in 1...M {
    for k2 in 1...M {
        let cardList = Array(1...n)
        let newIndex1 = Int(pow(2.0, Double(k1)))
        let newIndex2 = Int(pow(2.0, Double(k2)))
        if shuffle(shuffle(cardList, newIndex1), newIndex2) == L {
            result.append((k1, k2))
        }
    }
}

print(result[0].0, result[0].1)


