import Foundation

let n = Int(readLine()!)!
var words: [String] = []
for _ in 0..<n {
    words.append(readLine()!)
}

func areShomsimilar(_ word1: String, _ word2: String) -> Bool {
    if word1.count != word2.count { return false }

    var map1to2: [Character: Character] = [:]
    var map2to1: [Character: Character] = [:]

    for (char1, char2) in zip(word1, word2) {
        if let mapped = map1to2[char1], mapped != char2 {
            return false
        }
        if let mapped = map2to1[char2], mapped != char1 {
            return false
        }
        map1to2[char1] = char2
        map2to1[char2] = char1
    }

    return true
}

var count = 0
for i in 0..<n {
    for j in i+1..<n {
        if areShomsimilar(words[i], words[j]) {
            count += 1
        }
    }
}

print(count)
