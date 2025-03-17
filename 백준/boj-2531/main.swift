import Foundation

var flag = 0, cnt = 0, coupon = 0, maxi = 0
var sushi = [Int](repeating: 0, count: 300001)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,d,k,c) = (input[0], input[1], input[2], input[3])

for i in 0..<N{
    let num = Int(readLine()!)!
    sushi[i] = num
}

// 슬라이딩 윈도우
for i in 0..<N {
    var check = [Int](repeating: 0, count: 3001)
    flag = 0 // 중복된 스시 체크
    coupon = 1 // 쿠폰 스시가 있는지 확인
    for j in i..<i + k {
        if check[sushi[j % N]] == 1 {
            flag += 1 // 이미 먹은 초밥일 경우 중복 수 표시
        } else {
            check[sushi[j % N]] = 1 // 처음 먹어보는 초밥일 경우 체크
        }

        if sushi[j % N] == c {
            coupon = 0 // 쿠폰 스시 있을 시
        }
    }

    maxi = max(maxi, k - flag + coupon) // 연속으로 먹을 수 있는 최대접시 - 중복접시 + 쿠폰스시
}

print(maxi)

