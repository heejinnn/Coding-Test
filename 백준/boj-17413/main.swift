let S = readLine()!.split(separator: ">").map{String($0)}

for word in S{
    
    if let firstIndex = word.firstIndex(of: "<"), firstIndex == word.startIndex {
        print("\(word)>", terminator: "")
    }else{
        if word.firstIndex(of: "<") != nil{
            let temporaryWord = word.split(separator: "<").map{String($0)}
            let gapWord = temporaryWord[0].split(separator: " ").map{String($0)}
            printReversedWords(gapWord)
            print("<\(temporaryWord[1])>",terminator: "")
        }else{
            let gapWord = word.split(separator: " ").map{String($0)}
            printReversedWords(gapWord)
        }
    }
}

func printReversedWords(_ words: [String]) {
    for (wIndex, w) in words.enumerated() {
        print(String(w.reversed()), terminator: "")
        if wIndex < words.count - 1 {
            print(" ", terminator: "")
        }
    }
}


