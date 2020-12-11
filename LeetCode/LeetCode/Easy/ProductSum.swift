//
//  ProductSum.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 12/11/20.
//  Copyright © 2020 Radomyr Bezghin. All rights reserved.
//

import Foundation
class ProductSum {
  // Tip: You can cast each element with `as? [Any]` to check whether it is
  // an array or an integer.
    //Time: O(n) n - number of elements in array and subarrays
    //Space:O(d) where d is a depth of recursive stack
  static func productSum(_ array: [Any], multiplier: Int) -> Int {
    var currentSum = 0
    for element in array{
        if let arr = element as? [Any]{
            currentSum += productSum(arr, multiplier: multiplier + 1)
        } else if let integer = element as? Int{
            currentSum += integer
        }
    }
    return currentSum * multiplier
  }
}
