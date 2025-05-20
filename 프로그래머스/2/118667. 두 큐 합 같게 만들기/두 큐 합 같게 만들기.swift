import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var result = 0
    
    var q1 = queue1
    var q2 = queue2
    
    var q1Sum = q1.reduce(0,+)
    var q2Sum = q2.reduce(0,+)
    
    var totalCountSum = q1.count + q2.count
    
    var pointer1 = 0 
    var pointer2 = 0

    while result < totalCountSum * 2 {

       if q1Sum == q2Sum {break}

       if q1Sum > q2Sum {
           q1Sum -= q1[pointer1]
           q2Sum += q1[pointer1]
           q2.append(q1[pointer1])
           pointer1 += 1
       } else if q1Sum < q2Sum {
           q2Sum -= q2[pointer2]
           q1Sum += q2[pointer2]
           q1.append(q2[pointer2])
           pointer2 += 1
       }
       result += 1
    }
    
    if q1Sum != q2Sum{
        result = -1
    }

   return result
}