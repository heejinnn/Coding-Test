import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    
    //한 노드의 선을 끊었을 때 모두 탐색하면서 끊은 양쪽노드가 몇개인지 비교
    //DFS로 탐색하면서 시작 노드부터 끝까지 탐색하며 노드 개수 확인
    
    //1. 노드와 간선들 배열에 추가
    //2. 연결을 끊을 간선 선택
    //3. 2에서 끊긴 간선을 가지는 노드를 시작노드로 선택해 연결된 총 노드 개수 파악
    //4. 양쪽 총 노드 개수의 차를 절대값으로 구해서 가장 작은 값을 return
    
    
    var result = Int.max
    var graph = Array(repeating: [Int](), count: n+1)
    
    func dfs(_ start: Int) -> Int {
        var stack: [Int] = [start]
        var visited = Array(repeating: false, count: n+1)
        var count = 0
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            
            if !visited[node] {
                visited[node] = true
                count += 1 
                stack += graph[node]
            }
        }
        
        return count
    }
    
    for i in 0..<wires.count{
        let node1 = wires[i][0]
        let node2 = wires[i][1]
        
        graph[node1].append(node2)
        graph[node2].append(node1)
    }
    
    for i in 0..<wires.count{
        let node1 = wires[i][0]
        let node2 = wires[i][1]
       
        graph[node1].removeAll { $0 == node2 }
        graph[node2].removeAll { $0 == node1 }
        
        let count1 = dfs(node1)
        let count2 = dfs(node2)
        
        result = min(result, abs(count1 - count2))
        
        graph[node1].append(node2)
        graph[node2].append(node1)
    }
    

    return result
}