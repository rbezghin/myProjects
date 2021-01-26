//
//  SpiralTraverse.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/25/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
/*
 Runtime: O(n) - n is the number of elements in the array
 Space: O(n) - result contains n elements
 */

class SpiralTraverse {
    func spiralTraverse(array: [[Int]]) -> [Int] {
        // Write your code here.
        var result = [Int]()
        var x1 = 0, y1 = 0//starting
        var x2 = array.count-1, y2 = array[0].count-1//ending
        while x1 <= x2 && y1 <= y2{
            for y in y1...y2{
                result.append(array[x1][y])
            }
            for x in stride(from: x1+1, through: x2, by: 1) {
                result.append(array[x][y2])
            }
            for y in stride(from: y2-1, through: y1, by: -1) {
                if x1 == x2 {continue}
                result.append(array[x2][y])
            }
            for x in stride(from: x2-1, through: x1+1, by: -1){
                if y1 == y2 {continue}
                result.append(array[x][y1])
            }
            x1 += 1
            y1 += 1
            x2 -= 1
            y2 -= 1
        }
        return result
    }
    /*
     Runtine - O(n) number of elements in the array
     Space: O(n) number of stacks
     */
    func spiralTraverseRec(array: [[Int]]) -> [Int]{
        var result = [Int]()
        return spiralTraverseRecHelper(array: array, x1: 0, y1: 0, x2: array.count-1, y2: array[0].count-1, result: &result)
    }
    func spiralTraverseRecHelper(array: [[Int]], x1: Int, y1: Int, x2: Int, y2: Int, result: inout [Int]) -> [Int]{
        if !(x1 <= x2) || !(y1 <= y2){
            return result
        }
        for y in y1...y2{
            result.append(array[x1][y])
        }
        for x in stride(from: x1+1, through: x2, by: 1) {
            result.append(array[x][y2])
        }
        for y in stride(from: y2-1, through: y1, by: -1) {
            if x1 == x2 {continue}
            result.append(array[x2][y])
        }
        for x in stride(from: x2-1, through: x1+1, by: -1){
            if y1 == y2 {continue}
            result.append(array[x][y1])
        }
        return spiralTraverseRecHelper(array: array, x1: x1+1, y1: y1+1, x2: x2-1, y2: y2-1, result: &result)
    }
}
