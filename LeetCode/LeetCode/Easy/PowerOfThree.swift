//
//  PowerOfThree.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/7/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//
/*
 Runtime O(log3n) - everytime we divide by 3
 Space O(1)
 */
import Foundation

class PowerOfThree {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n == 1 {return true}
        //while 3 is less than number
        //mult by 3 if == number return true
        var num = 1
        while num < n {
            num *= 3
            if num == n {return true}
        }
        return false
    }
}
