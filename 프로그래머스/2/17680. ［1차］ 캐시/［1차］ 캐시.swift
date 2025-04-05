func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    let cities = cities.map{
        return $0.lowercased()
    }
    var cache = Array(repeating: "", count: cacheSize)
    var result = 0
    
    if cacheSize == 0{
        result = cities.count * 5
    } else{
        for i in 0..<cities.count{
            
            if cache.contains(cities[i]){
                result += 1
                cache.remove(at: cache.firstIndex(of: cities[i])!)
                cache.append(cities[i])
            }else{
                result += 5
                cache.append(cities[i])
                
                if cache.count > cacheSize{
                    cache.removeFirst()
                }
            }
            
        }
    }
    
    return result
}