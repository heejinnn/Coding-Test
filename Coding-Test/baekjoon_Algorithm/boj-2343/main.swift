let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0],input[1])

let lecture = readLine()!.split(separator: " ").map{Int(String($0))!}

let start = lecture.max()!
let end = lecture.reduce(0, +)
var result = 0

func binary_search(_ start: Int, _ end: Int){
    var cnt = 1
    var sum = 0
    
    if start > end{
        return
    }
    
    let mid = (start + end)/2
    
    for time in lecture{
        if sum + time > mid{
            cnt+=1
            sum = time
        }else{
            sum+=time
        }
    }
    
    if cnt <= M{
        result = mid
        binary_search(start, mid-1)
    }else{
        binary_search(mid+1, end)
    }
    
}
binary_search(start, end)

print(result)

