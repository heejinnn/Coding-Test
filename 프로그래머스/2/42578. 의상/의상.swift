import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var dict: [String : Int] = [:]
    var result = 1
    
    for i in 0..<clothes.count{
        let type = clothes[i][1]
        
        dict[type, default: 0] += 1
    }
    
    for key in dict.keys{
        result *= (dict[key]! + 1)
    }    
    result -= 1
    
    return result
}