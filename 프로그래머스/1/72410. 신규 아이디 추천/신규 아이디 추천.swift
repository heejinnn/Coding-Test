import Foundation

func solution(_ new_id:String) -> String {
    
    let step1 = new_id.lowercased()//소문자 치환
    let step2 = step1.replacingOccurrences(
        of: "[^a-z0-9-_.]",
        with: "",
        options: .regularExpression
    )
    
    let step3 = step2.replacingOccurrences(
        of: "\\.+",
        with: ".",
        options: .regularExpression
    )
    
    //step4
    let step4 = step3.replacingOccurrences(
        of: "^\\.|\\.$",
        with: "",
        options: .regularExpression
    )
    
    //step5
    
    var step5 = step4
    if step5.isEmpty{
        step5 += "a"
    }
    
    //step6
    var step6 = String(step5.prefix(15))
    if step6.hasSuffix("."){
        step6.removeLast()
    }
    
    //step7
    var step7 = step6
    if step7.count <= 2{
        let lastChar = String(step7.last!)
        while step7.count < 3{
            step7 += lastChar
        }
    }
    
    return step7
}