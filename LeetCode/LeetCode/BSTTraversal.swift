//
//  BSTTraversal.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 3/8/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
class BSTTraversal {
    class BST {
        var value: Int?
        var left: BST?
        var right: BST?
        
        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
        func insert(value: Int) -> BST {
            if value < self.value! { //go left
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
    }
    /*
     Time: O(n) - check every element
     Space: O(d) - d - depth of the tree
     */

    func inOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        // Write your code here.
        if let tree = tree{
            _ = inOrderTraversal(tree: tree.left, array: &array)
            if let value = tree.value{
                array.append(value)
            }
            _ = inOrderTraversal(tree: tree.right, array: &array)
        }
        return array
    }

    func preOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        // Write your code here.
        if let tree = tree{
            if let value = tree.value{
                array.append(value)
            }
            _ = inOrderTraversal(tree: tree.left, array: &array)
            _ = inOrderTraversal(tree: tree.right, array: &array)
        }
        return array
    }

    func postOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        // Write your code here.
        if let tree = tree{
            _ = inOrderTraversal(tree: tree.left, array: &array)
            _ = inOrderTraversal(tree: tree.right, array: &array)
            if let value = tree.value{
                array.append(value)
            }
        }
        return array
    }
}
