//
//  Number1Bits.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/8/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

class Number1Bits {
    func hammingWeight(_ n: Int) -> Int {
        let size = 32
        var count = 0
        var n = n
        for _ in 0 ..< size {
            count += (n & 1)
            n = n >> 1
        }
        return count
    }
}
