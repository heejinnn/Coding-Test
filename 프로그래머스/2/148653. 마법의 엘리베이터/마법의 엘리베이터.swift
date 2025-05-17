func solution(_ storey: Int) -> Int {
    var num = storey
    var result = 0
    
    while num > 0 {
        let digit = num % 10
        let next = (num / 10) % 10
        
        if digit > 5 {
            result += 10 - digit
            num += 10  // carry 발생
        } else if digit == 5 {
            if next >= 5 {
                result += 5
                num += 10  // carry 발생
            } else {
                result += 5
            }
        } else {
            result += digit
        }
        
        num /= 10
    }
    
    return result
}
