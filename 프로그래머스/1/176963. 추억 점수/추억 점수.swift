import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    
    var dict:[String : Int] = [:]
    var result = [Int]()
    var count = 1
    
    for i in 0..<name.count{
        dict[name[i]] = yearning[i]
    }
   
    for line in photo{
        var sum = 0
        for str in line{
            sum += dict[str, default: 0]
        }
        result.append(sum)
        count += 1
    }
    
    return result
}