let input = readLine()!.split(separator: " ").map{Int($0)!}

let (R,C) = (input[0],input[1])

var arr : [[String]] = []
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

var minR = R
var maxR = 0
var minC = C
var maxC = 0

for _ in 0..<R {
    let Input = Array(readLine()!).map {String($0)}
    arr.append(Input)
}

    
for x in 0..<R{
    for y in 0..<C{
        if arr[x][y] == "X"{
            var cnt = 0
            for k in 0..<4{
                let mx = x + dx[k]
                let my = y + dy[k]
                
                if ((mx == -1 || my == -1 || mx == R || my == C) || arr[mx][my] == ".") {
                    cnt+=1
                }
                
            }
            if cnt>=3{
                arr[x][y] = "*"
            }
            else{
                minC = min(minC,y);
                maxC = max(maxC,y);
                minR = min(minR,x);
                maxR = max(maxR,x);
            }
        }
    }
}

for i in minR...maxR{
    for j in minC...maxC{
        if arr[i][j] == "*"{
            print(".", terminator: "")
            continue
        }
        print(arr[i][j], terminator: "")
    }
    print("")
}


