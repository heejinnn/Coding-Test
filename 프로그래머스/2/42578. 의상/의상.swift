import Foundation

func solution(_ clothes:[[String]]) -> Int {
   
    var dict: [String:Int] = [:]
    var result = 1
    
    for i in 0..<clothes.count{
        let type = clothes[i][1]
        dict[type, default: 0] += 1
    }
    
    for key in dict.keys{
        result *= (dict[key]! + 1) //옷 선택 경우의 수 + 선택하지 않는 경우의 수
    }

    result -= 1 //아무것도 안 입는 경우 제거
    
    return result
}