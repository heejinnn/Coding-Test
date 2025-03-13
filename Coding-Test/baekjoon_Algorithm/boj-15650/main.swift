let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (N,M) = (input[0], input[1])
var arr = [Int](repeating: 0, count: M)
var bool = [Bool](repeating: false, count: N)
find(0)

func find(_ index: Int){
    if index == M{
        var check = false
        for i in 0..<arr.count{
            if i>=1, arr[i] <= arr[i-1]{
                check = true
            }
        }
        if !check{
            for i in 0..<arr.count{
                print(arr[i], terminator: " ")
            }
            print()
        }
        return
    }
    for i in 0..<N{
        if !bool[i]{
            bool[i] = true
            arr[index] = i+1
            find(index+1)
            bool[i]=false
        }
    }
}

