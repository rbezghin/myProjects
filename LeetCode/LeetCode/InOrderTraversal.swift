//
//  InOrderTraversal.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/26/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation


// Definition for a binary tree node.
 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
class InOrderTraversal {
         
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [TreeNode]()
        guard let root = root else {return []}
        stack.append(root)
        var current = root
        while !stack.isEmpty {
            while current.left != nil {
                stack.append(current.left!)
                current = current.left!
            }
            let node = stack.popLast()!
            result.append(node.val)
            if node.right != nil {
                current = node.right!
                stack.append(node.right!)
            }
        }
        return result
    }
}
