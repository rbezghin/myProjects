//
//  InsertionSort.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/2/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

/*
 Time: O(n^2)
 Space: O(1)
 */

class InsertionSort {
  func insertionSort(array: inout [Int]) -> [Int] {
    for i in 1..<array.count{// i - index of usorted elements
        for j in (0..<i).reversed(){// j - index of last sorted element
            if array[j+1] < array[j]{
                let temp = array[j]
                array[j] = array[j+1]
                array[j+1] = temp
            }
        }
    }
    return array
  }
}
