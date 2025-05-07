func solution(_ str1:String, _ str2:String) -> Int {
    
    var str1 = str1.lowercased().map{String($0)}
    var str2 = str2.lowercased().map{String($0)}
    
    var strArr1 : [String: Int] = [:]
    var strArr2 : [String: Int] = [:]
    let pattern = "^[a-zA-Z]*$"
    
    var intersectionCount = 0  
    var unionCount = 0
    
    var result: Double = 0
    
    for i in 0..<str1.count-1{
        let str = str1[i] + str1[i+1]
        var check = false
        
        guard let range = str.range(of: pattern, options: .regularExpression) else{
            continue
        }
        check = true
        
        if check{
            strArr1[str, default: 0] += 1  
            unionCount += 1
        }
    }
    
    for i in 0..<str2.count-1{
        let str = str2[i] + str2[i+1]
        
        var check = false
        
        guard let range = str.range(of: pattern, options: .regularExpression) else{
            continue
        }
        check = true
        
        if check{
            strArr2[str, default: 0]+=1
            unionCount += 1
        }
    }
    
    for key in strArr2.keys{
        if let num = strArr1[key], num >= 1 {
            intersectionCount += min(num, strArr2[key]!)
        } 
    }

    unionCount = unionCount - intersectionCount
    
    if strArr1.count == 0 , strArr2.count == 0{
       return 65536
    }
    result = Double(intersectionCount)/Double(unionCount) * 65536.0
    
    return Int(result)
}