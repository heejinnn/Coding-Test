import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    //cap: 트럭에 실을 수 있는 택배 상자 최대 개수
    //n: 배달할 집의 개수
    //deliveries: 배달할 택배 상자 개수
    //pickups: 수거할 택배 상자 개수
    
    //1. 가장 먼집부터 배달/수거 시작
    //1-1. 순서대로 배달/수거하면서 배달/수거 count 증가
    //1-2. 배달/수거 count - cap 하면서 모든 배열 값이 0이 될때까지 반복
    //왕복거리 += stop한 위치 * 2
    
    var dist: Int64 = 0
    var deliveries = deliveries
    var pickups = pickups
    
    var deliverRemain = 0
    var pickupRemain = 0
    
    for i in stride(from: n - 1, through: 0, by: -1) {
        deliverRemain += deliveries[i]
        pickupRemain += pickups[i]
        
        while deliverRemain > 0 || pickupRemain > 0 {
            deliverRemain -= cap
            pickupRemain -= cap
            dist += Int64((i + 1) * 2)
        }
    }
    
    return dist
}