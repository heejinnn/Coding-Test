import Foundation

func solution(_ record:[String]) -> [String] {
    var dict = [String: String]() 
    var logs = [(String, String)]() 
    
    for data in record {
        let splitData = data.split(separator: " ").map { String($0) }
        let command = splitData[0]
        let uid = splitData[1]
        
        switch command {
        case "Enter":
            let nickname = splitData[2]
            dict[uid] = nickname
            logs.append(("Enter", uid))
        case "Leave":
            logs.append(("Leave", uid))
        case "Change":
            let nickname = splitData[2]
            dict[uid] = nickname
        default:
            continue
        }
    }
    
    var result = [String]()
    
    for log in logs {
        let action = log.0
        let uid = log.1
        let nickname = dict[uid]!
        
        if action == "Enter" {
            result.append("\(nickname)님이 들어왔습니다.")
        } else if action == "Leave" {
            result.append("\(nickname)님이 나갔습니다.")
        }
    }
    
    return result
}
