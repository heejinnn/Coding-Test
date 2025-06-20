import Foundation

func solution(_ relation: [[String]]) -> Int {
    let columnCount = relation[0].count
    var candidateKeys: [[Int]] = []

    // 1. 모든 속성 조합을 만든다 (1개 ~ 전체까지)
    // 2. 유일성 검사: 이 조합으로 만든 튜플 모음이 중복이 없어야 함
    // 3. 최소성 검사: 이미 있는 후보키가 포함되어 있으면 안 됨
    
    func makeCombinations(_ n: Int) -> [[Int]] {
        var result = [[Int]]()
        
        func dfs(_ start: Int, _ path: [Int]) {
            if !path.isEmpty {
                result.append(path)
            }
            for i in start..<n {
                dfs(i + 1, path + [i])
            }
        }

        dfs(0, [])
        return result.sorted { $0.count < $1.count } 
    }

    let allCombinations = makeCombinations(columnCount)

    for comb in allCombinations {
        var seen = Set<String>()
        for row in relation {
            let key = comb.map { row[$0] }.joined(separator: ",")
            seen.insert(key)
        }

        if seen.count != relation.count {
            continue 
        }

        var isMinimal = true
        for key in candidateKeys {
            if Set(key).isSubset(of: Set(comb)) {
                isMinimal = false
                break
            }
        }

        if isMinimal {
            candidateKeys.append(comb)
        }
    }

    return candidateKeys.count
}
