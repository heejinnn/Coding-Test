

import Foundation

// 골 수, 골 넣은 시간
// 1. 팀별로 골 수를 저장한다.
// 2. 어떤 팀이 이기고 있는지 판단
// 3. 총 시간이 48분이니까 현재 골 넣은 시간과 다음 골 넣은 시간과의 차이를 계산
// 3-1. 다음 골 넣은 팀이 없다면, 팀 이긴 시간 += [48-현재 골 넣은 시간]
// 3-2. 다음 골 넣은 팀이 있다면, 팀 이긴 시간 += [다음 골 넣은 시간 - 현재 골 넣은 시간]



let N = Int(readLine()!)!
var goalBoards = [(team: Int, time: String)]()

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { String($0) }
    let team = Int(line[0])!
    let time = line[1]
    goalBoards.append((team, time))
}

// 시간 차이를 초 단위로 반환
func timeDiffInSeconds(_ start: String, _ end: String) -> Int {
    let startSplit = start.split(separator: ":").map { Int($0)! }
    let endSplit = end.split(separator: ":").map { Int($0)! }
    let startSec = startSplit[0] * 60 + startSplit[1]
    let endSec = endSplit[0] * 60 + endSplit[1]
    return endSec - startSec
}

// 초 단위를 "MM:SS" 형식 문자열로 변환
func formatTime(_ seconds: Int) -> String {
    let min = seconds / 60
    let sec = seconds % 60
    return String(format: "%02d:%02d", min, sec)
}

var score = [0, 0]
var leadTime = [0, 0]

// 각 골마다 확인
for i in 0..<N {
    let current = goalBoards[i]
    score[current.team - 1] += 1

    var leadingTeam: Int? = nil
    if score[0] > score[1] {
        leadingTeam = 0
    } else if score[1] > score[0] {
        leadingTeam = 1
    }

    let nextTime = (i + 1 < N) ? goalBoards[i + 1].time : "48:00"

    if let leader = leadingTeam {
        let diff = timeDiffInSeconds(current.time, nextTime)
        leadTime[leader] += diff
    }
}

print(formatTime(leadTime[0]))
print(formatTime(leadTime[1]))






