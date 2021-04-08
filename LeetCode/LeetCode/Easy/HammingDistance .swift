//
//  HammingDistance .swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/8/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

class HammingDistance {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var count = 0
        var x = x, y = y
        while x > 0 || y > 0 {
            count += (x%2 ^ y%2)
            x >>= 1
            y >>= 1
        }
        return count
    }
}
