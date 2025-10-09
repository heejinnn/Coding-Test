import Foundation

func solution(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
    //today는 YYYY.MM.DD 형태(오늘날짜)
    //terms: 약관 종류 (공백) 유효기간
    //약관 종류는 알파벳 대문자 A~Z
    //유효기간: 개인정보를 보관할 수 있는 달 수 
    //privacies: 날짜 (공백) 약관종류
    
    //모든 달은 28일까지 있다.
    //파기해야 할 개인정보 번호 출력

    
    //1. 오늘 날짜를 년, 월, 일로 분리
    //2. privacies에서 약관 종류에 따라 달 증가
    //2-1. 달이 12를 넘으면 년도 +1
    //2-2. 일이 28을 넘으면 달 +1
    //3. 계산한 privacies의 날짜가 오늘 날짜보다 전이라면 파기
    
    let todayArr = today.split(separator: ".").map{Int($0)!}
    let (year, month, day) = (todayArr[0], todayArr[1], todayArr[2])
    var termDict: [String : Int] = [:]
    var result = [Int]()
    
    //terms 분리
    for term in terms{
        let termData = term.split(separator: " ").map{String($0)}
        termDict[termData[0], default: 0] = Int(termData[1])!
        
    }
    
    //privacies 분리
    for (index, privacy) in privacies.enumerated() {
        let privacyData = privacy.split(separator: " ").map{String($0)}
        let privacyDate = privacyData[0].split(separator: ".").map{Int($0)!}
        var (privacyYear, privacyMonth, privacyDay) = (privacyDate[0], privacyDate[1], privacyDate[2])
        let period = termDict[privacyData[1]]!
        
        privacyDay -= 1
        for i in 0..<period{
            privacyDay += 28
            
            if privacyDay > 28{
                privacyDay -= 28
                privacyMonth += 1
            }
            
            if privacyMonth > 12{
                privacyMonth -= 12
                privacyYear += 1
            }
        }
        
        if privacyYear < year {
            result.append(index+1)
            continue
        } else if privacyYear == year, privacyMonth < month{
            result.append(index+1)
            continue
        } else if privacyYear == year, privacyMonth == month, privacyDay < day{
            result.append(index+1)
            continue
        }
    }
    
    return result
}
