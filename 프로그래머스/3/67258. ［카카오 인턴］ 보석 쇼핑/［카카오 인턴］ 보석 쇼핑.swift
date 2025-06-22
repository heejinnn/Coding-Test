import Foundation

func solution(_ gems: [String]) -> [Int] {
    
    // 1. 모든 보석 종류 개수 파악(set 사용)
    // 2. 투 포인터(left, right)로 윈도우 이동
    // 3. 가능한 구간일 경우 → 길이가 더 짧은 구간이면 정답 갱신

    let gemKinds = Set(gems)
    let kindCount = gemKinds.count
    var gemDict = [String: Int]()
    
    var left = 0
    var right = 0
    
    var answer = [0, gems.count - 1]
    var minLength = gems.count
    
    while right < gems.count {
        let gem = gems[right]
        gemDict[gem, default: 0] += 1
        right += 1
        
        while gemDict.count == kindCount {
            if (right - left) < minLength {
                minLength = right - left
                answer = [left, right - 1]
            }

            let leftGem = gems[left]
            if let count = gemDict[leftGem] {
                if count == 1 {
                    gemDict.removeValue(forKey: leftGem)
                } else {
                    gemDict[leftGem] = count - 1
                }
            }
            left += 1
        }
    }
    
    return [answer[0] + 1, answer[1] + 1]
}
