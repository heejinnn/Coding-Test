import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var arr = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)
    var link = Array(repeating: [Int](), count: N+1)
    
    for i in 0..<road.count {
        let from = road[i][0]
        let to = road[i][1]
        let cost = road[i][2]
        
        arr[from][to] = min(cost, arr[from][to])
        arr[to][from] = min(cost, arr[to][from])
        
        link[from].append(to)
        link[to].append(from)
    }

    var distance = Array(repeating: Int.max, count: N + 1)
    distance[1] = 0

    var queue: [(node: Int, cost: Int)] = [(1, 0)]

    while !queue.isEmpty {
        let current = queue.removeFirst()
        let currentNode = current.node
        let currentCost = current.cost

        for neighbor in link[currentNode] {
            let nextCost = currentCost + arr[currentNode][neighbor]
            
            if nextCost < distance[neighbor] {
                distance[neighbor] = nextCost
                queue.append((neighbor, nextCost))
            }
        }
    }

    return distance.filter { $0 <= k }.count
}