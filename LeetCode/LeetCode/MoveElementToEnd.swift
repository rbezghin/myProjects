//
//  MoveElementToEnd.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/12/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
/*
 Time: O(n) - iterating only once 
 Space: O(1)
 */
class MoveElementToEnd {
    func moveElementToEnd(_ array: inout [Int], _ toMove: Int) -> [Int] {
        // Write your code here.
        var i = 0, j = array.count - 1
        while i < j {
            while array[i] != toMove {
                i += 1
                if i > j {return array}
            }
            while array[j] == toMove {
                j -= 1
                if j < i {return array}
            }
            print("elements to swap are: ", i, j)
            let temp = array[i]
            array[i] = array[j]
            array[j] = temp
        }
        return array
    }
}
