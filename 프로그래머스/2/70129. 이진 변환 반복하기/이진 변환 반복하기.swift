import Foundation

func solution(_ s:String) -> [Int] {
    
    var str = s
    var result = Array(repeating: 0, count: 2)//0이 이진변환 수, 1이 0 몇개 제거했는지
    
    
    while str != "1"{
        let zeroCount = str.filter { $0 == "0"}.count//0 count
        let removeLength = str.count - zeroCount//0 제거 후 길이
        
        str = String(removeLength, radix: 2)
        result[1] += zeroCount
        result[0] += 1
    }
    
    
    
    return result
}