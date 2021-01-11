//
//  ThreeNumberSum.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/6/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
/*
 runtine - O(n^2) - sorting O(nlogn), forloop + whileloop n^2
 space - O(n) - for storing the resutls
 */

class ThreeNumberSum {
    func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
        // Write your code here.
        let array = array.sorted()
        var result = [[Int]]()
        for i in 0 ..< array.count-2 {
            var j = i+1, k = array.count-1
            while j < k {
                if array[i] + array[j] + array[k] == targetSum {
                    result.append(contentsOf: [[array[i], array[j], array[k]]])
                    j += 1; k -= 1
                } else if array[i] + array[j] + array[k] > targetSum {
                    k -= 1
                } else {
                    j += 1
                }
            }
        }
        return result
    }
}
