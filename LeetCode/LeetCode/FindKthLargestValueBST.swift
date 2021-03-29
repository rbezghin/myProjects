//
//  FindKthLargestValueBST.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 3/15/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

class FindKthLargestValueBST {
    // This is an input class. Do not edit.
    class BST {
        var value: Int
        var left: BST?
        var right: BST?

        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
    }

    func findKthLargestValueInBst(_ tree: BST, _ k: Int) -> Int {
        // Write your code here.
        let sortedBST = sortBST(tree)
        return sortedBST[sortedBST.count - k]
    }
    func sortBST(_ tree: BST?) -> [Int] {
        if tree == nil {
            return []
        }
        var leftValues = [Int]()
        var rightValues = [Int]()
        if let left = tree?.left {
            leftValues += sortBST(left)
        }
        if let right = tree?.right {
            rightValues += sortBST(right)
        }
        return leftValues + [tree!.value] + rightValues
    }
}

