let N = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = Int(readLine()!)!

let maxValue = arr.max()!
var result = 0
var maxSum = 0

binarySearch(1, maxValue)

func binarySearch(_ start: Int, _ end: Int){
    
    if start > end{
        return
    }
    var totalSum = 0
    
    let mid = (start + end) / 2

    for i in 0..<arr.count{
        if mid <= arr[i]{
            totalSum += mid
        }else{
            totalSum += arr[i]
        }
    }
 
    if totalSum > M{
        binarySearch(start, mid-1)
    }else{
        if maxSum < totalSum{
            result = mid
        }
        maxSum = max(maxSum, totalSum)
        binarySearch(mid+1, end)
    }
}
print(result)


