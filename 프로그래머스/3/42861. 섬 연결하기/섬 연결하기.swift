import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    // 크루스칼 알고리즘 + Union Find
    // 모든 섬이 서로 통행 가능하도록 만드는 최소 비용 찾기
    // 자신의 최상위 부모를 찾고(find), 최상위 부모를 합친다(union)
    //1. 자기 자신을 부모로 저장, 비용 기준으로 오름차순 정렬
    //2. 크루스칼 알고리즘 실행
    //2-1. 두 섬이 연결되어 있지 않으면, 비용 추가 + Union
    //3. Union은 Find로 부모를 찾아서 반납
    
    var node: [Int] = Array(0...n-1)
    let costs = costs.sorted { $0[2]<$1[2] }
    
    func find(_ x: Int) -> Int {
        if node[x] != x {
            node[x] = find(node[x])
        }
        return node[x]
    }
    
    func union(_ a: Int, _ b: Int){
        let rootA = find(a)
        let rootB = find(b)
        
        node[rootA] = rootB
    }
    
    var result = 0
    for cost in costs {
        let start = find(cost[0])
        let end = find(cost[1])
        let value = cost[2]
        
        if start != end {
            result += value
            union(start, end)
        }
    }
    
    return result
}