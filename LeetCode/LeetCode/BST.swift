//
//  BST.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/28/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

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
            if left != nil {
                left?.printTree()
            }
            print(value)
            if right != nil {
                right?.printTree()
            }
            return
        }
        /*
         Runtime: Average O(logn) n - length of array comparisons Worst O(n)
         Space: Average O(logn) n recursive calls Worst O(n)
         */
        func insert(value: Int) -> BST {
            if value < self.value { //go left
                if let left = self.left{
                    return left.insert(value: value)
                } else {
                    self.left = BST(value: value)
                }
            } else { //go right
                if let right = self.right{
                    return right.insert(value: value)
                } else {
                    self.right = BST(value: value)
                }
            }
            return self
        }
        /*
         Runtime: Average O(logn) n - length of array comparisons Worst O(n)
         Space: Average O(logn) n recursive calls Worst O(n)
         */
        func contains(value: Int) -> Bool {
            if self.value == value {
                return true
            } else if value < self.value {
                if let left = self.left {
                    return left.contains(value: value)
                } else {
                    return false
                }
            } else {
                if let right = self.right {
                    return right.contains(value: value)
                } else {
                    return false
                }
            }
        }
        /*
         Runtime: Average O(logn) n - length of array comparisons Worst O(n)
         Space: Average O(logn) n recursive calls Worst O(n)
         */
        func remove(value: Int?, parentNode: BST?) -> BST {
            if self.value == value {
                //has two children
                if self.left != nil && self.right != nil {
                    let rightLeftMostValue = findValue(node: self.right!)
                    self.value = rightLeftMostValue
                    self.right!.remove(value: rightLeftMostValue, parentNode: self)
                }
                else if parentNode == nil {
                    if let left = left {
                        self.value = left.value
                        self.right = left.right
                        self.left = left.left
                    } else if let right = right {
                        self.value = right.value
                        self.left = right.left
                        self.right = right.right
                    }
                }
                //is a leaf node
                else if self.left == nil && self.right == nil{
                    if self == parentNode?.left {
                        parentNode?.left = nil
                    } else {
                        parentNode?.right = nil
                    }
                }
                //has only one child
                else {
                    let child = self.left ?? self.right
                    if self == parentNode?.left {
                        parentNode?.left = child
                    } else {
                        parentNode?.right = child
                    }
                }
            } else { //find the value
                if value! < self.value{
                    if let left = self.left{
                        return left.remove(value: value, parentNode: self)
                    } else {
                        return self
                    }
                } else {
                    if let right = self.right{
                        return right.remove(value: value, parentNode: self)
                    } else {
                        return self
                    }
                }
            }
            return self
        }
        func findValue(node: BST) -> Int{
            if node.left == nil {
                return node.value
            } else {
                return findValue(node: node.left!)
            }
        }
    }
