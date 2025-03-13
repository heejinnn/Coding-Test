let str = String(readLine()!)
var newStr: String = str + str.reversed()

var minValue = Int.max

while newStr.count >= str.count{
    let firstValue = newStr.prefix(newStr.count/2)
    let value = newStr.suffix(newStr.count/2)
    let secondeValue = String(value.reversed())
    if firstValue == secondeValue {
        minValue = min(minValue, newStr.count)
    }
    
    if newStr.count == str.count{
        break
    }
    newStr.remove(at: newStr.index(str.endIndex, offsetBy: 0))
}

print(minValue)

