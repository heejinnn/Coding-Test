var arr : [String] = Array(readLine()!).map {String($0)}
let duck : [String] = ["q", "u", "a", "c", "k"]
var cnt = 0
var duck_index = 0
var remain = arr.count

while remain != 0 {
    let check = remain
    
    cnt += 1
    duck_index = 0
    for i in 0..<arr.count{
        if arr[i] != "O"{
            search(i)
        }
    }
    
    if check == remain {
        break
    }
}

func search(_ index: Int){
        
    
    if arr[index] == duck[duck_index]{
        arr[index] = "O"
        duck_index += 1
    }
    
    if duck_index == 5{
        duck_index = 0
        remain -= 5
    }
    
}

print( remain==0 ? cnt : -1)

