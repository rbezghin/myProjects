//
//  RunLengthEncoding.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/5/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
class RunLengthEncoding {
  func runLengthEncoding(_ string: String) -> String {
    var result = String()
    var counter = 0
    guard var currentChar = string.first else {return ""}
    for char in string {
        if currentChar == char && counter == 9{
            result.append("\(counter)\(currentChar)")
            counter = 0
        }
        else if currentChar != char {
            result.append("\(counter)\(currentChar)")
            counter = 0
            currentChar = char
        }
        counter += 1
    }
    result.append("\(counter)\(currentChar)")
    return result
  }
}
