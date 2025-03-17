let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (A, B, C) = (input[0], input[1], input[2])

func divide(_ N: Int) -> Int {
  
  if N == 0 { return 1 }
  
  if N % 2 == 0 {
    let d = divide(N/2)
    return d % C * d % C
  } else {
    let d = divide((N - 1)/2)
    return d % C * d % C * A % C
  }
}

print(divide(B))
