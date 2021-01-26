//
//  IsMonotonic.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/24/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
class IsMonotonic {
    func isMonotonic(array: [Int]) -> Bool {
        // Write your code here.
        if array.count <= 2{
            return true
        }
        var decreasing = true
        var increasing = true

        for index in 1..<array.count {
            if array[index-1] < array[index] {
               decreasing = false
            }
            if array[index-1] > array[index] {
                increasing = false
            }
        }
        return increasing || decreasing
    }
}
