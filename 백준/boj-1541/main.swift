
let input = readLine()!.split(separator: "-").map({String($0)})

var arr: [Int] = []

var result = 0


for i in 0..<input.count{
    let n = input[i].split(separator: "+").map({Int(String($0))!})

    if i==0{
        result += n.reduce(0, +)
    }
    else{
        result -= n.reduce(0, +)
    }
}
print(result)

