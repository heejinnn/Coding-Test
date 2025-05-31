import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    // 요금표를 기준으로 입차와 출차 사이 시간에 대한 비용을 계산하자
    // 1. 차량번호에 따라 입차와 출차 사이 시간을 분으로 계산, 차량번호를 키로 하는 딕셔너리에 누적 주차 시간을 저장함
    //1-1.IN일 경우 → 차량번호: 입차 시간을 딕셔너리에 저장
    //1-2.OUT일 경우 → 저장된 입차 시간과 출차 시간의 차이를 계산하여 누적 시간에 더함
    //1-3. 모든 레코드를 처리한 뒤에도 IN만 있고 OUT이 없는 차량은→ 출차 시간이 "23:59"인 것으로 간주하여 누적 시간 계산
    
    // 2. 주차 요금 계산
    //2-1. 누적 주차 시간 <= 기본 시간이면 주차 요금 = 기본 요금
    //2-2. 누적 주차 시간 > 기본 시간이면 주차 요금 = 기본 요금 + ((주차시간 - 기본 시간) / 단위 시간) * 단위 요금
    //ceil를 사용하여 올림처리 필요
    
    // 3. 차량 번호를 오름차순 정렬하여 결과를 배열로 반환함
    
    let (baseTime, baseFee, unitTime, unitFee) = (fees[0], fees[1], fees[2], fees[3])

    var inTimeDict: [String: Int] = [:]     // 입차 시간 기록
    var totalTimeDict: [String: Int] = [:]  // 누적 주차 시간

    for record in records {
        let parts = record.split(separator: " ").map { String($0) }
        let timeStr = parts[0]
        let carNum = parts[1]
        let inoutType = parts[2]

        let timeParts = timeStr.split(separator: ":").map { Int($0)! }
        let minutes = timeParts[0] * 60 + timeParts[1]

        if inoutType == "IN" {
            inTimeDict[carNum] = minutes
        } else {
            if let inTime = inTimeDict[carNum] {
                let duration = minutes - inTime
                totalTimeDict[carNum, default: 0] += duration
                inTimeDict.removeValue(forKey: carNum)
            }
        }
    }
    
     for (carNum, inTime) in inTimeDict {
        let duration = (23 * 60 + 59) - inTime
        totalTimeDict[carNum, default: 0] += duration
    }
    
    let sortedDict = totalTimeDict.sorted{$0.key < $1.key}
    var result = [Int]()
    
    for (carNum, totalTime) in sortedDict{
        if totalTime <= baseTime{
            result.append(baseFee)
        }else{
            let duration = baseFee + Int(ceil(Double(totalTime - baseTime) / Double(unitTime))) * unitFee
            result.append(duration)
        }
    }
    
    
    return result
}