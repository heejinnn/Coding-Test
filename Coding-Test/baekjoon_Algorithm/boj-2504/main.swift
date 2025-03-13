import Foundation

let input = readLine()!

var arr: [String] = []
var brac1: Int = 0
var brac2: Int = 0

var value: Int = 1
var result: Int = 0


for str in input{
    arr.append("\(str)")
}

for i in 0..<arr.count {
    if brac1 == -1 || brac2 == -1{
        result = 0
        break
    }
    
    else if arr[i] == "("{
        brac1 += 1
        value *= 2
    }
    
    else if arr[i] == "["{
        brac2 += 1
        value *= 3
    }
    
    else if arr[i] == ")"{
        if brac1 == 0 {
            result = 0
            break
        }
        else if arr[i-1] == "(" {
            result += value
        }
        brac1 -= 1
        value /= 2
    }
    else if arr[i] == "]"{
        if brac2 == 0 {
            result = 0
            break
        }
        else if arr[i-1] == "["{
            result += value
        }
        brac2 -= 1
        value /= 3
    }
}

if brac1 == 0 && brac2 == 0 {
    print(result)
}
else {
    print(0)
}


