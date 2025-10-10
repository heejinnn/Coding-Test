import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    // 1. 가능한 모든 할인율 조합을 완전탐색 (DFS)
    // 2. 깊이가 이모티콘 개수에 도달하면, 현재 할인 조합을 기준으로 사용자별 계산 수행
    // 3. 각 사용자에 대해
    // 3-1. 최소 할인 비율과 구매 기준 금액을 확인
    // 3-2. 모든 이모티콘 탐색하며, 할인율이 사용자 기준 이상이면 구매 금액에 반영
    // 3-3. 최종 구매 금액이 기준 금액 이상이면 => 가입자 수 증가, 기준 금액 미만이면 => 판매액에 누적
    // 4. 모든 사용자 계산이 끝난 뒤
    // => 현재 조합 결과를 기존 result와 비교
    // => 가입자 수가 더 많거나, 같다면 판매액이 더 높은 경우 result 갱신
    // 5. 아직 모든 이모티콘에 대해 할인율을 정하지 않았다면, [10, 20, 30, 40] 중 하나를 선택하고 다음 depth로 재귀 호출
    // 6. DFS 종료 후, 최적의 [가입자 수, 판매액] 조합 반환

    
    var result: [Int] = [0,0]
    let discounts = [10,20,30,40]
    let emoticonCount = emoticons.count
    var discountCombination: [Int] = Array(repeating: 0, count: emoticonCount)
    
    func dfs(_ depth: Int){
        
        if depth == emoticonCount {
            var joinCount = 0 
            var totalPrice = 0
            
            for user in users{
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
                    totalPrice += userTotal
                }
            }
            
            if joinCount > result[0] || (joinCount == result[0] && totalPrice > result[1]) {
                result = [joinCount, totalPrice]
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