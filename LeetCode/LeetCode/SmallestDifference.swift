//
//  SmallestDifference.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/8/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
/*
 Time: Onlong + Omlogm <- sorting of both arrays. Iteration is O(n+m)
 Space: O(1) <- no extra space allocated
 */

class SmallestDifference {
    func smallestDifference(arrayOne: inout [Int], arrayTwo: inout [Int]) -> [Int] {
        let array1 = arrayOne.sorted()
        let array2 = arrayTwo.sorted()
        
        var result = [Int]()
        var i = 0, j = 0
        
        var smallest = Int.max
        var currentSmallest = Int.max
        
        while i < array1.count && j < array2.count {
            currentSmallest = absDifference(first: array1[i], second: array2[j])
            if currentSmallest < smallest {
                smallest = currentSmallest
                result = [array1[i], array2[j]]
            }
            if array1[i] > array2[j]{
                j += 1
            } else if array1[i] < array2[j] {
                i += 1
            } else { //they are equal, minimum difference
                return [array1[i], array2[j]]
            }
        }
        return result
    }
    private func absDifference(first: Int, second: Int) -> Int {
        return abs(first - second)
    }
}
