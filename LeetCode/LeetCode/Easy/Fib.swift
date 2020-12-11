//
//  old.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 12/8/20.
//  Copyright © 2020 Radomyr Bezghin. All rights reserved.
//
import Foundation

class Fib{
    // Time O(n)
    // Space O(1)
    static func getNthFibIterative(n: Int) -> Int{
        if n <= 1{
            return 0
        } else if n == 2{
            return 1
        }
        var current = 0
        var array = [0,1]
        
        for _ in 0..<n-2{
            current = array[0] + array[1]
            array[0] = array[1]
            array[1] = current
        }
        return current
    }
    // Time O(n) with memoization, and it would be O(2^n) without it. for every element in n you get two more calls
    // Space O(n) - for dict
    static func getNthFibRecursive(n: Int) -> Int{
        var dict = [Int: Int]()
        return getFib(&dict, n)
    }
    static func getFib( _ dict: inout [Int: Int], _ n: Int) -> Int {
        if(n == 0){
            return 0
        }
        else if n == 1 {
            return 1
        }
        if let value  = dict[n] {
            return value
        } else{
            let result = getFib(&dict, n - 1) + getFib(&dict, n - 2)
            dict[n] = result
            return result
        }
    }
}

//class Node {
//    
//    let name: String
//    var children: [Node]
//
//    init(name: String) {
//        self.name = name
//        children = []
//    }
//
//    func addChild(name: String) -> Node {
//        let childNode = Node(name: name)
//        children.append(childNode)
//        return self
//    }
//
//    func depthFirstSearch(array: inout [String]) -> [String] {
//        // Write your code here.
//        //recursiveDFS(node: self ,array: &array)
//        iterativeDFS(node: self ,array: &array)
//        return array
//    }
//    // add current node to the queue
//    // while queue not empty
//    // dequeue node
//    // add name to the array
//    // add all its children to the queue
//    func iterativeDFS(node: Node, array: inout [String]) {
//        var stack = Stack<Node>()
//        stack.push(element: node)
//        while !stack.isEmpty() {
//            guard let currentNode = stack.pop() else {return} //should not actually happen
//            array.append(currentNode.name)
//            for child in currentNode.children.reversed() {
//                print("Enqueuing ", child.name)
//                stack.push(element: child)
//            }
//            
//        }
//    }
//    func recursiveDFS(node: Node, array: inout [String]) {
//        // base case, no chilldren then go back
////        if node.children.isEmpty {
////            return
////        }
//        array.append(node.name)
//        for child in node.children {
//            recursiveDFS(node: child, array: &array)
//        }
//    }
//}
//let node = Node(name: "A")
//
//node.addChild(name: "B")
//node.addChild(name: "C")
//node.addChild(name: "D")
//
//node.children[0].addChild(name: "E")
//node.children[0].addChild(name: "F")
//
//node.children[0].children[1].addChild(name: "I")
//node.children[0].children[1].addChild(name: "J")
//
//var array = [String]()
//print(node.depthFirstSearch(array: &array))
