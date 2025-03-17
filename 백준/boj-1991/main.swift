let N = Int(readLine()!)!

struct Node {
    let left: String
    let right: String
}

var graph: [String: Node] = [:]

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{String($0)}
    graph[input[0]] = Node(left: input[1], right: input[2])
    
}

func preorder(_ node: String){
    if node == "." {
        return
    }
    
    print(node, terminator: "")
    preorder(graph[node]!.left)
    preorder(graph[node]!.right)
}

func inorder(_ node: String){
    if node == "." {
        return
    }
    
    inorder(graph[node]!.left)
    print(node, terminator: "")
    inorder(graph[node]!.right)
}

func postorder(_ node: String){
    if node == "." {
        return
    }
    
    postorder(graph[node]!.left)
    postorder(graph[node]!.right)
    print(node, terminator: "")
}

let orders = [preorder, inorder, postorder]
orders.forEach {
    $0("A")
    print()
}

