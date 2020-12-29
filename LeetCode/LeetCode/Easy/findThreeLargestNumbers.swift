//
//  findThreeLargestNumbers.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 12/29/20.
//  Copyright © 2020 Radomyr Bezghin. All rights reserved.
//

import Foundation

/* no sorting, can have duplicates
 Brute Force:
 store 3 largest numbers in a new array
 keep them in sorted order
 if you find a number that is larger than smallest of largest - add it
 pop smallest element
*/
class FindThreeLargestNumbers {
  func findThreeLargestNumbers(array: [Int]) -> [Int] {
    // Write your code here.
    var result = Array(array[0..<3])
    result.sort()
    for element in array[3...] {
        if element > result[0]{
            result.remove(at: 0)
            result.append(element)
            result.sort() // <- O(nlogn) sorting where n is a number of largest numbers to store
        }
    }
    return result
  }
}
