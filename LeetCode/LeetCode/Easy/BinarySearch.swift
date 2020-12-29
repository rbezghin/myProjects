//
//  BinarySearch.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 12/11/20.
//  Copyright © 2020 Radomyr Bezghin. All rights reserved.
//

import Foundation

/*
 Binary search
 if length of array is zero
    return -1
 find a mid point of the array
 check if its the number we are looking for
    if yes return index
 check if its in the left part less
    return reccur to the left
 check if its the right part
    return reccur to the right
 

 
 */

class BinarySearch {
  func binarySearch(array: [Int], target: Int) -> Int {
    return binIterative(leftPointer: 0, rightPointer: array.count-1, array: array, target: target)
  }
    ///iterative
    ///Time: O(logn) slice in half every time
    ///Space: O(1) no extra space or call stacks
    private func binIterative(leftPointer: Int, rightPointer: Int, array: [Int], target: Int) -> Int{
        
        var leftPointer = leftPointer
        var rightPointer = rightPointer
        
        while !(leftPointer > rightPointer) {
            let midPointer = (rightPointer + leftPointer) / 2
            if target == array[midPointer]{
                return midPointer
            }
            else if target < array[midPointer]{
                rightPointer = midPointer - 1
            }
            else {
                leftPointer = midPointer + 1
            }
        }
        return -1
    }
    
    ///Recursive:
    ///Time - O(logn) in the worst case we will split array in half every time.
    ///Space - O(logn) logn recursion stacks, no other extra memory
    private func bin(leftPointer: Int, rightPointer: Int, array: [Int], target: Int) -> Int{
        if leftPointer > rightPointer {
            return -1
        }
        let midPointer = (rightPointer + leftPointer) / 2
        if target == array[midPointer]{
            return midPointer
        }
        else if target < array[midPointer]{
            return bin(leftPointer: leftPointer, rightPointer: midPointer - 1, array: array, target: target)
        }
        else {
            return bin(leftPointer: midPointer + 1, rightPointer: rightPointer, array: array, target: target)
        }
    }
}
