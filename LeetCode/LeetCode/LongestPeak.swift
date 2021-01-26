//
//  LongestPeak.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/26/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

class LongestPeak {
    func longestPeak(array: [Int]) -> Int {
        // Write your code here.
        if array.count < 3 {
            return 0
        }
        var maxLength = 0
        var i = 1
        while i <= array.count-2{
            if array[i]>array[i-1] && array[i]>array[i+1]{
                //found a peak
                var currentLength = 3
                var m = i-2, n = i+2
                while m>=0 && array[m]<=array[m+1]{
                    currentLength += 1
                    m -= 1
                }
                while n<=array.count-1 && array[n]<=array[n-1]{
                    currentLength += 1
                    n += 1
                }
                if currentLength > maxLength {
                    maxLength = currentLength
                }
                i = n
            } else {
                i += 1
            }
        }
        return maxLength
    }
}
