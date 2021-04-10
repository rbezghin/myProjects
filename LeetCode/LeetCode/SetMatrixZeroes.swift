//
//  SetMatrixZeroes.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/9/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//
/*
 Given an m x n matrix. If an element is 0, set its entire row and column to 0. Do it in-place.
 
 Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
 Output: [[1,0,1],[0,0,0],[1,0,1]]
 
 
 for element 0,0 if its zero keep it as zero, but also make
 starting with row 1 col 1 mark their rows&col 0 if element is 0
 
 */
import Foundation

class SetMatrixZeroes {
    func setZeroes(_ matrix: inout [[Int]]) {
        var isColZero = false
        for row in 0 ..< matrix.count {
            if matrix[row][0] == 0 {isColZero = true}
            for col in 0 ..< matrix[0].count {
                if matrix[row][col] == 0 {
                    matrix[0][col] = 0
                    matrix[row][0] = 0
                }
            }
        }
        for row in 1 ..< matrix.count {
            for col in 1 ..< matrix[0].count {
                if matrix[0][col] == 0 || matrix[row][0] == 0 {
                    matrix[row][col] = 0
                }
            }
        }
        if matrix[0][0] == 0 {
            for col in 0 ..< matrix[0].count {
                matrix[0][col] = 0
            }
        }
        if isColZero {
            for row in 0 ..< matrix.count {
                matrix[row][0] = 0
            }
        }
    }
}
