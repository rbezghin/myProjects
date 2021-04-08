//
//  PascalTriangle.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/8/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

/*
 generate level by level
 formula ??
                1
            1       1
        1       2       1
     1      3       3       1
 1      4       6       4       1
 
 current number is element(row-1 col-1) + element(row-1 col+1)
 if outside of bounds element is 1
 ourside of bounds - num is either < 0 or num is > row-2 (row  == num of elements in that row)
 
 
 
 */
import Foundation
class PascalTriangle {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else {return []}
        var output = [[Int]]()
        for row in 0 ..< numRows {
            output.append([])
            for col in 0 ..< row+1 {
                if col == 0 || col == row {
                    output[row].append(1)
                }
                else {
                    output[row].append(output[row-1][col-1] + output[row-1][col])
                }
            }
        }
        return output
    }
}
