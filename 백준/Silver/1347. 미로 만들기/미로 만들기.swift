
import Foundation

let MAX = 50
let size = MAX * 2 + 1

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var map = Array(repeating: Array(repeating: "#", count: size), count: size)

var n = 0
var input = readLine()!
if let num = Int(input) {
    n = num
}

var x = MAX
var y = MAX
var dir = 0//남쪽부터 시작

var tlx = MAX, tly = MAX
var brx = MAX, bry = MAX

map[x][y] = "."

let commands = readLine()!.map { $0 }

for op in commands {
    switch op {
    case "R":
        dir = (dir + 3) % 4//우회전
    case "L":
        dir = (dir + 1) % 4//좌회전
    case "F":
        x += dx[dir]
        y += dy[dir]
        tlx = min(tlx, x)
        tly = min(tly, y)
        brx = max(brx, x)
        bry = max(bry, y)
        map[x][y] = "."
    default:
        continue
    }
}

for i in tlx...brx {
    for j in tly...bry {
        print(map[i][j], terminator: "")
    }
    print()
}

