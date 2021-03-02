//
//  FirstDuplicateValue.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/28/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
/*
 Runtine: O(n) - for loop over every element and hashmap lookup is O(1)
 Space: O(n) - hashmap might contain all the elements
 */
class FirstDuplicateValue {
    func firstDuplicateValue(_ array: inout [Int]) -> Int {
        var set = Set<Int>()
        for element in array{
            if set.contains(element) {
                return element
            } else {
                set.insert(element)
            }
        }
        return -1
    }
    /*
     this one has O(1) space and O(n) runtime
     */
    func firstDuplicateValueSpacy(_ array: inout [Int]) -> Int{
        for element in array {
            if array[element-1] != -1 {
                array[element-1] = -1
            } else {
                return element
            }
        }
        return -1
    }
    
}
