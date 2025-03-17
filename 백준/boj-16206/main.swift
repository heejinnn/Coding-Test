let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (N,M) = (input[0], input[1])
var cnt = 0
var result = 0

var arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var arr1 = [Int]()
var arr2 = [Int]()

for n in arr{
    if n%10 == 0{
        arr1.append(n)
    }
    else if n<10{
        continue
    }
    else if n == 10{
        result += 1
    }
    else{
        arr2.append(n)
    }
}
arr1.sort()
arr2.sort()


for i in 0..<arr1.count{
    if cnt >= M{
        break
    }
    
    if cnt < M{
        cnt += (arr1[i]/10) - 1
        result += arr1[i]/10
        
        if cnt > M{
            result = result - (cnt - M + 1)
            break
        }
    }
}

for i in 0..<arr2.count{
    
    if cnt >= M{
        break
    }
    
    if cnt < M{
        cnt += (arr2[i]/10)
        result += arr2[i]/10
        
        if cnt > M{
            result = result - (cnt - M)
            break
        }
    }

}

print(result)

