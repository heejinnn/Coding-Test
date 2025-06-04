import Foundation

func solution(_ s:String) -> [Int] {
    
    //1. 문자열 파싱
    //1-1. s 바깥의 {{,}} 제거하기
    //1-2. {,}를 제거하고 배열 만들기
    //2. 배열을 count에 따라 오름차순으로 정리
    //3. result에 저장되지 않은 숫자는 추가하고, 아니면 넘어가도록
    
    var str = s
    str.removeFirst(2)
    str.removeLast(2)
    
    let setStrings = str.components(separatedBy: "},{")
    var setArr = setStrings.map{
        $0.split(separator: ",").compactMap{Int($0)}
    }
    
    setArr.sort{$0.count < $1.count}
    
    var result = [Int]()
    
    for data in setArr{
        if data.count == 1 {
            result.append(contentsOf: data)
        }
        for d in data{
            if !result.contains(d){
                result.append(d)
            }
        }
    }
    
    return result
}