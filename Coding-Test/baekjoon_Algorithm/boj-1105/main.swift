import Foundation
let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (L,R) = (input[0], input[1])

var result = 0
var length = String(L).count

func find(){

    if String(L).count == String(R).count{
        var n1 = Int(pow(10.0, Double(length)))
        
        n1 /= 10
        if (L/n1)%10 != (R/n1)%10 {
            result = 0
            return
        }

        for _ in 0..<length{

            if (L/n1)%10 == 8, (R/n1)%10 == 8{
                result += 1
            }else if (L/n1)%10 != (R/n1)%10{
                break
            }
            n1 /= 10
        }
        
    }else{
        result = 0
    }
}
find()
print(result)


