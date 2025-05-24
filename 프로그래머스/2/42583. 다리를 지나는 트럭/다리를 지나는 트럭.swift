import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var readyTruck = truck_weights
    var time = 0
    var bridgeQueue : [(weight: Int, time: Int)] = []
    var totalWeight = 0
    
    
    while !(readyTruck.isEmpty && bridgeQueue.isEmpty){
        
        time+=1
        
        if let first = bridgeQueue.first, time - first.time >= bridge_length{
            totalWeight -= first.weight
            bridgeQueue.removeFirst()
        }
        
        if let nextTruck = readyTruck.first, totalWeight + nextTruck <= weight{
            readyTruck.removeFirst()
            bridgeQueue.append((nextTruck, time))
            totalWeight += nextTruck
        }

    }
    
    return time
}