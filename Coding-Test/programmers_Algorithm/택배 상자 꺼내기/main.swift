import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {


    var rowVal = 0

    if n%w != 0{
        rowVal = n/w + 1
    } else{
        rowVal = n/w
    }

    var arr = Array(repeating: Array(repeating: 0, count: w), count: rowVal)
    var cnt = 1
    var resultArr = Array(repeating: 0, count: 2)

    for i in 0..<rowVal{
        if i % 2 == 0 || i == 0{
            for j in 0..<w{
                if cnt > n{
                    break
                }

                if cnt == num {
                    resultArr[0] = i
                    resultArr[1] = j
                }
                arr[i][j] = cnt
                cnt += 1
            }
        } else {
            for j in stride(from: w-1, to: -1, by: -1){
                 if cnt > n{
                    break
                }
                if cnt == num {
                    resultArr[0] = i
                    resultArr[1] = j
                }
                 arr[i][j] = cnt
                 cnt += 1
            }
        }
    }
    var result = 0

    for row in stride(from: rowVal-1, to: -1, by: -1) {
        if arr[row][resultArr[1]] != 0, arr[row][resultArr[1]] != num{
            result += 1
        } else if arr[row][resultArr[1]] == num{
            result += 1
            break
        }
    }

    return result
}
