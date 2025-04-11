import Foundation

func solution(_ word:String) -> Int {
    let alpha = "AEIOU".map { String($0) }
    var result = [String]()

    func dfs(_ str: String) {
        result.append(str)

        if str.count == 5 { return }

        for i in 0..<5 {
            dfs(str + alpha[i])
        }
    }

    dfs("")
    return result.firstIndex(of: word)!
}