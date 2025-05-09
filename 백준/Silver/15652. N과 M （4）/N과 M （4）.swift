
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (input[0], input[1])
var arr = [Int](repeating: 0, count: M)

func find(_ index: Int, _ current: Int){
    if index == M{
        for i in 0..<arr.count{
            print(arr[i], terminator: " ")
        }
        print()
        return
    }
    
    for i in current...N{
        arr[index] = i
        find(index+1, i)
    }
}

find(0, 1)
