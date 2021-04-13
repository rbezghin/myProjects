//
//  LongestSubstring.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/12/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//
/*
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
  
//1 find substring without repeating
for loop over the string
create a map and add charaters as you iterate starting with current index
when encounter letter twice store largest count
 Runtime
 O(n) - length of the string
 O(n) - adding current substring
 total O(n^2)
 Space
 O(n) - add whole string
 
 
 //2 SLIDING WINDOW EASY
 left, right to track indices of the window
 they start at zero, move right when characters not in hash set, add them to the hash set
 update current largest window
 move left when encounter character in the hash set, remove char from the hash set
 
 abcadc
 
 Time O(n) while loop iterate over all the characters
 Space O(n) hashmap to add all the element, string array
 */
import Foundation
class LongestSubstring {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let arrayString = Array(s)
        var hashMap = [Character: Bool]()
        var maxCount = 0
        var left = 0, right = 0
        while right < arrayString.count {
            if hashMap[arrayString[right]] == nil {
                hashMap[arrayString[right]] = true
                maxCount = max(maxCount, hashMap.count)
                right += 1
            } else {
                hashMap[arrayString[left]] = nil
                left += 1
            }
        }
        return maxCount
    }
}
