//
//  ArrayOfProducts.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/26/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
/*
 Time: O(n) mltiple not nested for loops
 Space: O(n) extra arrays on lenth n
 */
class ArrayOfProducts {
  func arrayOfProducts(_ array: [Int]) -> [Int] {
    // Write your code here.
    var leftProducts = Array(repeating: 1, count: array.count)
    var rightProducts = Array(repeating: 1, count: array.count)
    var results = Array(repeating: 1, count: array.count)
    //create left products
    var leftProduct = 1
    for i in 1..<array.count{
        leftProduct *= array[i-1]
        leftProducts[i] = leftProduct
    }
    var rightProduct = 1
    for i in stride(from: array.count-2, through: 0, by: -1){
        rightProduct *= array[i+1]
        rightProducts[i] = rightProduct
    }
    for i in 0..<array.count{
        results[i] = leftProducts[i] * rightProducts[i]
    }
    return results
  }
}
