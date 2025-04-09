import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var result = Array(repeating: 0, count: 2)
    var nWords = Array(repeating: [String](), count: n)
    
    var index = 0
    var lastWord = ""
    var isContains = false
    for word in words{  
        let CurrentfirstWord = String(word[word.startIndex])
        
        for i in 0..<n{
            if nWords[i].contains(word){
                result[0] = index + 1
                result[1] = nWords[index].count + 1
                isContains = true
            }
        }
        if isContains == true{
            break
        }
        
        
        if lastWord != CurrentfirstWord, lastWord != ""{
            result[0] = index + 1
            result[1] = nWords[index].count + 1
            break
        } else{
            nWords[index].append(word)
            if index == n-1{
                index = 0
            } else{
                index += 1
            }
        }
        lastWord = String(word[word.index(before: word.endIndex)])
    }
    
    
    return result
}

