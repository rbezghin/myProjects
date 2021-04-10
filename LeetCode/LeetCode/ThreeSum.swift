//
//  3Sum.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/9/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

/*
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 
 i j k nums
 
 if i = -1 then j + k  = 1
 
 j+k = 2sum problem ahahah
 
 if j = 0 then find if we have  k = 1-j
 
 
 hash map to check if there is an element
 
 
 create hashmap
 for index in
 
 */

import Foundation
class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {return []}
        var result = [[Int]]()
        let nums = nums.sorted()
        for index in 0 ..< nums.count-2 { //[1,2,3]
            if index != 0 && nums[index] == nums[index-1]{continue}
            let sum = 0 - nums[index]
            var left = index+1, right = nums.count-1
            while left < right {
                let currentSum = nums[left] + nums[right]
                if currentSum == sum {
                    result.append([nums[index], nums[left], nums[right]])
                    while left < right && nums[left] == nums[left+1] {left += 1}
                    while left < right && nums[right] == nums[right-1] {right -= 1}
                    left += 1; right -= 1
                } else if currentSum > sum {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return result
    }
}
