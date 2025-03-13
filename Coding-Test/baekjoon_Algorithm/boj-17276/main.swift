
import Foundation

let t = Int(readLine()!)!
var arr: [[Int]] = []
var copyArr: [[Int]] = []//복사본 저장할 배열
var result: [String] = []

for _ in 0..<t{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var (n, d) = (input[0], input[1])
    
    d = (d >= 0) ? d/45 : (d/45) + 8
    
    arr = []
    copyArr = []
    for _ in 0..<n {
        var arrValue = readLine()!.split(separator: " ").map { Int(String($0))! }
        arr.append(arrValue)
    }
    copyArr = arr
    
    for _ in 0..<d{
        rotateArr(n)
    }
    
    for value in arr{
        for v in value{
            result.append("\(v) ")
        }
        result.append("\n")
        
    }
}


func rotateArr(_ n: Int){
    let i = 0
    for i in 0..<n {
        copyArr[i][n/2] = arr[i][i];
        copyArr[i][i] = arr[n/2][i];
        copyArr[n/2][i] = arr[n-i-1][i];
        copyArr[n-i-1][i] = arr[n-i-1][n/2];
    }
    arr = copyArr
    
}

print(result.map{String($0)}.joined(separator: ""), terminator: "")//줄 바뀜 없이 출력위해 terminator
