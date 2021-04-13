//
//  LongestPalindromeSubstr.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/12/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//
/*
 Input: s = "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 
 iterate over array of characters
 for every character run longest palidrome that checks
    characters to the left and right if its a palindrome and its length
    it returns length
    keep track of max length
 
    
 */
import Foundation
class LongestPalindromeSubstr {
    func longestPalindrome(_ s: String) -> String {
        let s = Array(s)
        var start = 0, end = 0
        for index in 0 ..< s.count {
            let length1 = palindromeLength(string: s, left: index, right: index)
            let length2 = palindromeLength(string: s, left: index, right: index+1)
            let len = max(length1, length2)
            if len > end - start {
                start = index - ((len - 1)/2) //current index minus the half of length of palndrome
                end = index + (len/2)
            }
        }
        return String(s[start...end])
    }
    func palindromeLength( string: [String.Element], left: Int, right: Int) -> Int {
        if left > right {return 0}
        var left = left, right = right
        while left >= 0 && right < string.count && string[left] == string[right]{
            left -= 1; right += 1
        }
        return right - left - 1
    }
}
