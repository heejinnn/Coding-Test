import Foundation

//board에서 인형은 작은 행부터 뽑을 수 있다.
//moves가 3이라면 board 3열에서 가장 작은 행 중에서 0이 아닌 값

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    let n = board[0].count
    var board = board
    var bucket: [Int] = []
    var result = 0
    
    for move in moves {
        let colIndex = move - 1
        
        //특정 열의 행 찾기
        for j in 0..<n{
            if board[j][colIndex] != 0{
                let doll = board[j][colIndex]
                board[j][colIndex] = 0
                
                if let last = bucket.last, last == doll {
                    bucket.removeLast()
                    result += 2
                } else{
                    bucket.append(doll)
                } 
                break
            }
        }
    }
    
    return result
}
