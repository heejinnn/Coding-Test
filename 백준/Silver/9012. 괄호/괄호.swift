import Foundation

let t = Int(readLine()!)!

//(가 있다면 무조건)로 닫아야한다.
//(를 저장하는 stack이 있다.
//(를 만나면 stack에 저장하고, )를 만나는 순간 (스택에서 하나 지우기
//만약에 )를 만나서 (스택 지워야하는데 (스택이 비어있다면 NO 바로 출력
//(스택이 다 비워지고 중간에 NO가 출력되지 않았으면 YES 출력

var result: [String] = []

for _ in 0..<t{
    let inputPS = readLine()!.map{String($0)}
    
    var isValid = true
    var arrLeft: [String] = []
    
    for i in 0..<inputPS.count{
        if inputPS[i] == "("{
            
            arrLeft.append("(")
            
        } else{
            guard arrLeft.count > 0 else { isValid = false; break}
            
            arrLeft.removeLast()
        }
    }
    
    if arrLeft.count != 0 || !isValid{
        result.append("NO")
    } else{
        result.append("YES")
    }
}

result.forEach{print($0);}