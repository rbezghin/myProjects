//
//  MinHeightBST.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 3/9/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
class MinHeightBST {
  static func minHeightBST(_ array: [Int]) -> BST? {
    // Write your code here.
    return minHeightBSTHelperBetter(array, startingIndex: 0, endingIndex: array.count-1)
  }
    /*
     Time: O(nlogn) add n elemenent n times we call logn insertion
     Space: O(n) n - n stacks of n elements
     */
    static func minHeightBSTHelper(_ array: [Int], _ bst: BST?, startingIndex: Int, endingIndex: Int) -> BST? {
        if startingIndex > endingIndex {
            return nil
        }
        var tree = bst
        let midPoint = (startingIndex+endingIndex)/2
        if let tree = tree{
            tree.insert(value: array[midPoint])
        } else {
            tree = BST(value: array[midPoint])
        }
        _ = minHeightBSTHelper(array, tree, startingIndex: startingIndex, endingIndex: midPoint-1)
        _ = minHeightBSTHelper(array, tree, startingIndex: midPoint+1, endingIndex: endingIndex)
        
        return tree
    }
    /*
     YOLO
     Time: O(n) n additions of the elements
     Space: O(n) n stacks at length of array
     */
    static func minHeightBSTHelperBetter(_ array: [Int], startingIndex: Int, endingIndex: Int) -> BST? {
        if startingIndex > endingIndex {
            return nil
        }
        let midPoint = (startingIndex+endingIndex)/2
        let tree = BST(value: array[midPoint])
        tree.left = minHeightBSTHelperBetter(array, startingIndex: startingIndex, endingIndex: midPoint-1)
        tree.right = minHeightBSTHelperBetter(array, startingIndex: midPoint+1, endingIndex: endingIndex)
        return tree
    }
  class BST {
    var value: Int
    var left: BST?
    var right: BST?

    init(value: Int) {
      self.value = value
    }

    func insert(value: Int) {
      if value < self.value {
        if let left = self.left {
          left.insert(value: value)
        } else {
          left = BST(value: value)
        }
      } else {
        if let right = self.right {
          right.insert(value: value)
        } else {
          right = BST(value: value)
        }
      }
    }
  }
}
