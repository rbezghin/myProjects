//
//  ReverseBits.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/8/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
class ReverseBits {
    func reverseBits(_ n: Int) -> Int {
        var result = 0, n = n, power = 31
        while n > 0 {
            result += (n&1) << power
            power -= 1
            n >>= 1
        }
        return result
    }
}
