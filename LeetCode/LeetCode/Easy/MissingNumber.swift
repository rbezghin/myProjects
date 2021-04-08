//
//  MissingNumber.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/8/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
class MissingNumber {
    func missingNumber(_ nums: [Int]) -> Int {
        let expectedSum = (nums.count * (nums.count + 1)) / 2
        let actualSum = nums.reduce(0) {$0 + $1}
        return expectedSum - actualSum
    }
}
