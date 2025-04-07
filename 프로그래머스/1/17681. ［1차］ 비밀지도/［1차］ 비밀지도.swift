func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var length = arr1.count
    var map1 = Array(repeating: [String](), count: length)
    var map2 = Array(repeating: [String](), count: length)
    
    // 지도 1과 지도 2에서 하나라도 벽이면 => 전체지도 벽
    // 지도 1과 지도 2에서 모두 공백이면 => 전체지도 공백

    
    // 지도 1
    for i in 0..<length{
        var row = String(arr1[i], radix: 2)
        let rowArr = row.map { String($0) }
        if rowArr.count < length{
            let count = length - rowArr.count
            for j in 0..<count{
                map1[i].append("0")
            }
            map1[i].append(contentsOf: rowArr)
        } else{
            map1[i].append(contentsOf: rowArr)
        }
    }
    
    // 지도 2
    for i in 0..<length{
        var row = String(arr2[i], radix: 2)
        let rowArr = row.map { String($0) }
        if rowArr.count < length{
            let count = length - rowArr.count
            for j in 0..<count{
                map2[i].append("0")
            }
            map2[i].append(contentsOf: rowArr)
        } else{
            map2[i].append(contentsOf: rowArr)
        }
    }
    
    // 전체지도
    for i in 0..<length{
        var row: String = ""
        for j in 0..<length{
            if map1[i][j] == "0", map2[i][j] == "0"{
                row += " "
            } else{
                row += "#"
            }
        }
        answer.append(row)
    }
    
    return answer
}