//
//  ValidateBST.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 3/2/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
class ValidateBST {
  // This is an input class. Do not edit.
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
        var current = self
        while true{
            if value < current.value! { //go left
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
    func validateBst(tree: BST) -> Bool {
        var min = Int.min
        var max = Int.max
        return validateHelper(tree: tree, min: tree.value!, max: tree.value!-1)
    }
    func validateHelper(tree: BST, min: Int, max: Int) -> Bool {
        if let left = tree.left{
            if left.value! >= tree.value!{
                return false
            }
            return validateHelper(tree: left, min: min, max: max)
        }
        if let right = tree.right{
            if right.value! < tree.value!{
                return false
            }
        }
        return false
    }
  }
    
    func validateBst(tree: BST) -> Bool {
        let min = Int.min
        let max = Int.max
        return validateHelper(tree: tree, min: min, max: max)
    }
    func validateHelper(tree: BST, min: Int, max: Int) -> Bool {
        if tree.value! < min || tree.value! >= max {
            return false
        }
        var leftIsvalid = true
        var rightIsvalid = true
        if let left = tree.left{
            let currentMax = tree.value!
            leftIsvalid = validateHelper(tree: left, min: min, max: currentMax)
        }
        if let right = tree.right{
            let currentMin = tree.value!
            rightIsvalid = validateHelper(tree: right, min: currentMin, max: max)
        }
        return leftIsvalid && rightIsvalid
    }
}

