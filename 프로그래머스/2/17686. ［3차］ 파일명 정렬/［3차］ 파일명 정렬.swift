import Foundation

func solution(_ files: [String]) -> [String] {
    var parsedFiles: [(original: String, head: String, number: Int, index: Int)] = []

    for i in 0..<files.count {
        let file = files[i]
        var head = ""
        var number = ""
        var isHeadDone = false

        for ch in file {
            if !isHeadDone {
                if ch.isNumber {
                    isHeadDone = true
                    number += String(ch)
                } else {
                    head += String(ch)
                }
            } else {
                if ch.isNumber && number.count < 5 {
                    number += String(ch)
                } else {
                    break
                }
            }
        }

        parsedFiles.append((original: file, head: head.lowercased(), number: Int(number) ?? 0, index: i))
    }

    // 정렬: head → number → 원래 순서
    parsedFiles.sort {
        if $0.head != $1.head {
            return $0.head < $1.head
        } else if $0.number != $1.number {
            return $0.number < $1.number
        } else {
            return $0.index < $1.index
        }
    }

    var result: [String] = []
    for file in parsedFiles {
        result.append(file.original)
    }

    return result
}
