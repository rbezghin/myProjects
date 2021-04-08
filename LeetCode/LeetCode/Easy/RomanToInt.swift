//
//  RomanToInt.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/7/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//
/*
 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 
 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Larget to Smallest
 
 ('I', 'V', 'X', 'L', 'C', 'D', 'M')
 
 
 dict of ('I': 1, 'V': 5, 'X': 10, 'L': 50, 'C: 100', 'D': 500, 'M': 1000)
 loop through string element by element and adding values to the total
 if value is in the wrong place subtract it from total. IE if I is before V
 
 so for looping we need two pointers to check next element as well
 
 */

import Foundation

class RomanToInt {
    
    let dict: [Character: Int]  =
        ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    
    func romanToInt(_ s: String) -> Int {
        if s.count == 1 {return getInt(s.first!)}
        var total = 0
        let arrayString = Array(s)
        var i = 0, j = 1
        while j < s.count {
            let a = getInt(arrayString[i])
            let b = getInt(arrayString[j])
            if a < b {
                total -= a
            } else {
                total += a
            }
            i += 1; j += 1;
        }
        if i == s.count - 1 {
            total += getInt(s.last!)
        }
        return total
    }
    func getInt(_ char: Character) -> Int {
        return dict[char]!
    }
}
