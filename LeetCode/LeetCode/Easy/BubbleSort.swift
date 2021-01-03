//
//  BubbleSort.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 12/29/20.
//  Copyright © 2020 Radomyr Bezghin. All rights reserved.
//

import Foundation

//Time: O(n^2) on average, 
//Space: O(1) no extra space is used
 
class BubbleSort {
  func bubbleSort(array: inout [Int]) -> [Int] {
    var didSwap = true
    while didSwap {
        didSwap = false
        for index in 0..<array.count{
            if index + 1 > array.count - 1{
                break
            }
            if array[index] > array[index + 1]{
                let temp = array[index + 1]
                array[index + 1] = array[index]
                array[index] = temp
                didSwap = true
            }
        }
    }
    return array
  }
}
