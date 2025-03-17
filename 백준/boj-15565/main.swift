let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (N,K) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var result = Int.max
var start = 0
var end = 0
var cnt = 0

while true {
    if cnt >= K{
        if arr[start] == 1{
            cnt -= 1
        }
        start += 1
    }else if end == N{
        break
    }else {
        if arr[end] == 1{
            cnt+=1
        }
        end += 1
    }
    if cnt == K{
        result = min(result, end - start)
    }
}
print(result > N ? -1 : result)

