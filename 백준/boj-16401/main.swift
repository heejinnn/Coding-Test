let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (M,N) = (input[0], input[1])
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
arr.sort()

var result = 0

binarySearch(1, arr[N-1])

func binarySearch(_ left: Int, _ right: Int){
    if left > right {
        print(result)
        return
    }

    let mid = (left+right)/2
    var cnt = 0
    
    for i in 0..<arr.count{
        cnt += arr[i]/mid
    }

    if cnt >= M {
        result = max(result, mid)
        binarySearch(mid+1, right)
    }else{
        binarySearch(left, mid-1)
    }
}

