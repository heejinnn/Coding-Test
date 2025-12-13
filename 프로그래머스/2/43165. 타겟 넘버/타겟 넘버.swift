import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    //더하기, 빼기를 노드로 가져가기
    
    var result = 0
    
    func bfs(_ sum: Int, _ index: Int, _ option: Int){
        if index >= numbers.count{
            return
        }
        
        var new_sum = 0
        
        if option == 0{
             new_sum = sum + numbers[index]
        } else{
             new_sum = sum - numbers[index]
        }
        
        bfs(new_sum, index + 1, 0)
        bfs(new_sum, index + 1, 1)
        
        if new_sum == target, index == numbers.count - 1{
            result += 1
            return
        }
    }
    
    bfs(0, 0, 0)
    bfs(0, 0, 1)
    
    
    return result
}