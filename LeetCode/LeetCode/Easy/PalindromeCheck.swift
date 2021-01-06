//
//  PalindromeCheck.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/5/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
/*
 Runtime - O(n)
 Space - O(1)
 */
class PalindromeCheck {
  func isPalindrome(string: String) -> Bool {
    let string = Array(string)
    var i = 0, j = string.count-1
    while true{
        if i == j || i > j || j < i{
            return true
        }
        else if string[i] != string[j]{
            return false
        }
        i += 1; j -= 1;
    }
  }
}
