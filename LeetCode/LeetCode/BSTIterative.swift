//
//  BSTIterative.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 3/1/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

class BSTIterative {
    class BST: Equatable {
        static func == (lhs: BST, rhs: BST) -> Bool {
            return lhs.value == rhs.value
        }
        
        var value: Int
        var left: BST?
        var right: BST?

        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
        func printTree(){
            var queue = [BST]()
            queue.append(self)
            while !queue.isEmpty{
                let bst = queue.removeFirst()
                print(bst.value)
                if bst.right != nil {
                    queue.append(bst.right!)
                }
                if bst.left != nil {
                    queue.append(bst.left!)
                }
            }
        }
        /*
         Runtime: Average O(logn) worst O(n)
         Space: Average O(1)
         */
        func insert(value: Int) -> BST {
            var current = self
            while true{
                if value < current.value { //go left
                    if let left = current.left{ //go left
                        current = left
                    } else { //create left and return
                        current.left = BST(value: value)
                        return self
                    }
                } else { //go right
                    if let right = current.right{
                        current = right
                    } else {
                        current.right = BST(value: value)
                        return self
                    }
                }
            }
        }
        /*
         Runtime: Average O(logn) worst O(n)
         Space: Average O(1)
         */
        func contains(value: Int) -> Bool {
            var current = self
            while true{
                if current.value == value{
                    return true
                } else if value < current.value { //go left
                    if let left = current.left { //go left
                        current = left
                    } else { //create left and return
                        return false
                    }
                } else { //go right
                    if let right = current.right{
                        current = right
                    } else {
                        return false
                    }
                }
            }
        }
        /*
         Runtime: Average O(logn) worst O(n)
         Space: Average O(1)
         */
        func remove(value: Int?, parentNode: BST?) -> BST {
            var current = self
            var parentNode = parentNode
            while true{
                if current.value == value{
                    //do removal
                    //has two kids
                    if current.left != nil && current.right != nil {
                        let rightLeftMostValue = findValue(node: current.right!)
                        current.value = rightLeftMostValue
                        _ = current.right!.remove(value: rightLeftMostValue, parentNode: current)
                    }
                    //is a rootnode, has no parent node
                    else if parentNode == nil {
                        if let left = current.left {
                            current.value = left.value
                            current.right = left.right
                            current.left = left.left
                        } else if let right = current.right {
                            current.value = right.value
                            current.left = right.left
                            current.right = right.right
                        }
                    }
                    //is a leaf node
                    else if current.left == nil && current.right == nil{
                        if current == parentNode?.left {
                            parentNode?.left = nil
                        } else {
                            parentNode?.right = nil
                        }
                    }
                    //has only one child
                    else {
                        let child = current.left ?? current.right
                        if current == parentNode?.left {
                            parentNode?.left = child
                        } else {
                            parentNode?.right = child
                        }
                    }
                    return self
                    //find the value if it exist
                } else if value! < current.value { //go left
                    if let left = current.left { //go left
                        parentNode = current
                        current = left
                        
                    } else { //create left and return
                        return self
                    }
                } else { //go right
                    if let right = current.right{
                        parentNode = current
                        current = right
                    } else {
                        return self
                    }
                }
            }
        }
        func findValue(node: BST) -> Int{
            var current = node
            while true {
                if current.left == nil {
                    return current.value
                } else {
                    current = current.left!
                }
            }

        }
    }
}
