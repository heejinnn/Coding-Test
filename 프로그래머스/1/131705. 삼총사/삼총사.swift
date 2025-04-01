import Foundation

func solution(_ number:[Int]) -> Int {
    
    var result = 0
    var arr = [Int]()
    var sum = 0
    
    for i in 0..<number.count{   
        arr.append(number[i])
        for j in i+1..<number.count{
            arr.append(number[j])
            for k in j+1..<number.count{
                arr.append(number[k])
                if arr.count == 3{
                    sum += arr[0] + arr[1] + arr[2]
                    if sum == 0{
                        result += 1
                    }
                    arr.removeLast()
                    sum = 0
                }
            }
            arr.removeLast()
        }
        arr.removeLast()
    }
    
    return result
}