//
//  IncreasingTripletSubsequence.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/13/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//
/*
 Input: nums = [1,2,3,4,5]
 Output: true
 Explanation: Any triplet where i < j < k is valid.
 
 if less than 3 elem return false
 i=0 j=1 k=2
 while k < length
    if i !< j && i !< k
    move i,j,k
    else if j !< k
    move j k
    else
    break ?
 return k != length
 
 */

import Foundation
class IncreasingTripletSubsequence {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else {return false}
        var small = Int.max, medium = Int.max
        for num in nums {
            if num < small {
                small = num
            } else if num < medium {
                medium = num
            } else {
                return true
            }
        }
        return false
    }
}
