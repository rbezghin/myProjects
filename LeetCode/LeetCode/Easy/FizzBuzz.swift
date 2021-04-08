//
//  FizzBuzz.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/7/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

/*
 check if number is divisible by one of the keys
 if yes then append that string to the current answer
 if string is empty then append number to a string
 
 Runtime - O(n*m) m - num of keys
 Space - O(1)
 */

class FizzBuzz {
    
    func fizzBuzz(_ n: Int) -> [String] {
        let dict = [3: "Fizz", 5: "Buzz" ]
        var resultStrings = [String]()
        for num in 1...n {
            var currentString = ""
            for key in dict.keys {
                if num % key == 0 {
                    currentString.append(dict[key]!)
                }
            }
            if currentString.isEmpty {
                resultStrings.append("\(num)")
            } else {
                resultStrings.append(currentString)
            }
        }
        return resultStrings
    }
}
