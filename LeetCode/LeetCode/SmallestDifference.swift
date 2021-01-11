//
//  SmallestDifference.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/8/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

class SmallestDifference {
    func smallestDifference(arrayOne: inout [Int], arrayTwo: inout [Int]) -> [Int] {
        let array1 = arrayOne.sorted()
        let array2 = arrayTwo.sorted()
        print(array1, array2)
        var result = [Int]()
        var i = 0, j = 0
        while i < array1.count && j < array2.count {
            if result.isEmpty {
                result = [array1[i],array2[j]]
                if (array1[i]) > (array2[j]){
                    j += 1
                } else {
                    i += 1
                }
                continue
            }
            let smallestDiff = absDifference(first: result.first!, second: result.last!)
            let currentDiff = absDifference(first: array1[i], second: array2[j])
            print(smallestDiff, currentDiff)
            print(i, j)
            if currentDiff < smallestDiff {
                result = [array1[i], array2[j]]
                //figure out what index to advance
                if (array1[i]) > (array2[j]){
                    j += 1
                } else {
                    i += 1
                }
            } else {
                if (array1[i]) > (array2[j]){
                    j += 1
                } else {
                    i += 1
                }
            }
        }
        return result
    }
    private func absDifference(first: Int, second: Int) -> Int {
        return abs(first - second)
    }
}
