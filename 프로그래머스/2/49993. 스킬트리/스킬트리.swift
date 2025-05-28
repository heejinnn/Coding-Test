import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    
    //skill의 순서를 지키면서 배워야 함
    //skill_trees에서 스킬들을 모두 탐색하며 skill의 순서대로 배우고 있는지 확인
    //최종적으로 가능한 스킬트리 개수를 return
    
    //1. skill을 arr에 저장
    //2. skill_trees의 데이터 탐색하면서 skill에 포함된다면
    //2-1. skill[0]번째에 있다면 skill.removeFirst()
    //2-2. skill[0]번째에 없는데 skill에 포함이 된다면, break
    
    //3. possible으로 가능한 스킬트리인지 확인
    //3-1. 2-2인 경우에만 possible을 false로 설정해서 처리ㅎ
    
    var result = 0
    
    for i in 0..<skill_trees.count{
        var possible = true
        var skillArr = skill.map{String($0)}
        for tree in skill_trees[i]{
            
            let value = String(tree)
            
            if skillArr.contains(value){
                if value == skillArr[0]{
                    skillArr.removeFirst()
                }else{
                    possible = false
                    break
                }
            }
        }
        
        if possible{
            result += 1
        }
    }
    
    return result
}