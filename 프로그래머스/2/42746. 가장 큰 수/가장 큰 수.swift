import Foundation

func solution(_ numbers:[Int]) -> String {
    var numbers = numbers.map{String($0)}
    numbers.sort{
        return $0+$1 > $1+$0
    }
    
    if numbers[0] == "0"{
        return "0"
    } 
    
    return numbers.joined()
}