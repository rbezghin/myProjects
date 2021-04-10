//
//  TelephoneLetterCombinations.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/8/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//
/*
 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 
for every digit in digits           2
    for every char in string        a
        for every other digit in digits+1 3
            for every char in string
                char+char
            
    
        
 
 
 */

import Foundation
class TelephoneLetterCombinations {
    
    var letters: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl",
               "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 1 {
            return letters[digits.first!]!.reduce([], { $0 + [String($1)] })
        }
        let arrayString = Array(digits)
        var result = [String]()
        for i in 0 ..< arrayString.count {
            for leftChar in letters[arrayString[i]]! {
                for j in i+1 ..< arrayString.count {
                    for rightChar in letters[arrayString[j]]! {
                        if leftChar != rightChar {
                            result.append("\(leftChar)\(rightChar)")
                        }
                    }
                }
            }
        }
        let set = Set(result)
        var temp = Array(set)
        temp = temp.filter({$0.first! != $0.last!})
        return temp
    }
}
