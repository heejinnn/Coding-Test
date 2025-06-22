import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    // 동시에 한명만 심사를 할 수 있다.
    // 하지만 더 빨리 끝내는 심사대가 있으면 기다렸다가 그곳으로 가서 심사를 받을 수 있다.
    // 모든 사람이 심사를 받는데 걸리는 시간을 최소로 하고 싶다.
    
    // 1. 탐색 범위 설정
    // 1-1. 최소 시간 left는 1
    // 1-2. 최대 시간 right는 가장 느린 심사관이 n명을 모두 처리할 때
    // 2. 이진 탐색 시작 (시간 기준 탐색)
    // 3. mid 시간 동안 심사 가능한 총 인원 계산
    // 4. 총 인원 수로 가능 여부 판단
    
    var left: Int64 = 1
    var right: Int64 = Int64(times.max()!) * Int64(n)
    var answer: Int64 = right

    while left <= right {
        let mid = (left + right) / 2

        let total = times.reduce(0) { $0 + mid / Int64($1) }

        if total >= Int64(n) {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return answer
}