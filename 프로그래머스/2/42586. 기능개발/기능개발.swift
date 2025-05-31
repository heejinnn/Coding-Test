import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    //progress에서 speeds 만큼 증가하면 100프로가 되기까지 몇일이 걸리는지 구하기
    //progresses 순서에 따라 앞 순서가 완료되지 못하면 뒤에 순서는 대기
    //1. progress에서 speeds에 따라 100프로까지 계산
    //1-1. Int(celi(Double(100 - progress) / Doblue(speeds))) 는 걸리는 날짜
    //2. 앞 순서의 progress 걸리는 날짜가 현재 index에서 걸리는 날짜보다
    //2-1. 작다면, result에 추가
    //2-2. 크다면, 앞 순서 result index에 값을 +1
    
    let n = progresses.count
    var date = Array(repeating: 0, count: n)
    
    for i in 0..<n {
        let progress = progresses[i]
        let speed = speeds[i]
        
        date[i] = Int(ceil(Double(100 - progress) / Double(speed)))
    }
    
    var before = date[0]
    var result = [1]
    var index = 0
    
    for i in 1..<n{
        if before >= date[i]{
            result[index] += 1
        } else{
            before = date[i]
            result.append(1)
            index += 1
        }
    }
    
    return result
}