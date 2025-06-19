import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    // 1. 할 수 있는 모든 할인율 조합 찾기
    // 1-1. 중복 순열
    // 2. 각 할인율 조합에 따른 user의 가입 여부
    // 2-1. 할인율이 최소 할인율보다 크거나 같으면 → 구매, 합 계산
    // 2-2. 할인율이 최소 할인율보다 작으면 -> 패스
    // 3. 가입자 수가 가장 많고, 같으면 수익이 높은 조합 저장
    
    
    let discounts = [10, 20, 30, 40]
    var result = [0, 0] // [가입자 수, 판매액]
    let emoticonCount = emoticons.count
    
    var discountCombination: [Int] = Array(repeating: 0, count: emoticonCount)
    
    func dfs(_ depth: Int) {
        if depth == emoticonCount {
            var joinCount = 0
            var totalSales = 0
            
            // 사용자마다 구매 확인
            for user in users {
                let userMinDiscount = user[0]
                let userPriceLimit = user[1]
                var userTotal = 0
                
                for i in 0..<emoticonCount {
                    let discount = discountCombination[i]
                    if discount >= userMinDiscount {
                        let discountedPrice = emoticons[i] * (100 - discount) / 100
                        userTotal += discountedPrice
                    }
                }
                
                if userTotal >= userPriceLimit {
                    joinCount += 1
                } else {
                    totalSales += userTotal
                }
            }
            
            if joinCount > result[0] || (joinCount == result[0] && totalSales > result[1]) {
                result = [joinCount, totalSales]
            }
            return
        }
        
        for discount in discounts {
            discountCombination[depth] = discount
            dfs(depth + 1)
        }
    }
    
    dfs(0)
    
    return result
}