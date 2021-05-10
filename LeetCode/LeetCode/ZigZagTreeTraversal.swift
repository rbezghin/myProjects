//
//  ZigZagTreeTraversal.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/27/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

/*
 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[20,9],[15,7]]
 
 
 */

class ZigZagTreeTraversal {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {return []}
        var array = helper(root, leftToRight: false).filter({ !$0.isEmpty })
        array.insert([root!.val], at: 0)
        return array
    }
    func helper(_ root: TreeNode?, leftToRight: Bool) -> [[Int]] {
        if root == nil {
            return []
        }
        var current = [Int]()
        if let val = root?.left?.val {
            current.append(val)
        }
        if let val = root?.right?.val {
            current.append(val)
        }
        current = leftToRight ? current : current.reversed()
        if leftToRight {
            return [current] + helper(root?.left, leftToRight: false) + helper(root?.right, leftToRight: false)
        } else {
            return [current] + helper(root?.left, leftToRight: true) + helper(root?.right, leftToRight: true)
        }
    }
}
