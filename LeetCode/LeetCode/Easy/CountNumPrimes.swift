//
//  CountNumPrimes.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/7/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
/*
 Count the number of prime numbers less than a non-negative number, n.
 Input: n = 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 
 Make primes < n
 Count them while finding them
 
 How to find prime numbers.... prime numbers are indivisible
 
 countPrimes calls isPrime and count how many are prime
 isPrime checks if any number is divisible by prev numbers
 
 2 for loops works but too slow !
 */
class CountNumPrimes {
    func countPrimes(_ n: Int) -> Int {
        var count = 0
        var primes = Array(repeating: true, count: n)
        //check if prime
        for i in 2...n {
            if i*i >= n {break}
            //mark all multiples as false
            if primes[i]{
                for j in i...n {
                    if j*i >= n {break}
                    primes[i*j] = false
                }
            }
        }
        //count all remainin true
        count = primes.filter({$0}).count
        return count
    }
    func countPrimesSlow(_ n: Int) -> Int {
        if n <= 2 {return 0}
        if n == 3 {return 1}
        var counter = 1
        for num in 3 ..< n {
            if isPrimeSlow(num: num) {counter += 1}
        }
        return counter
    }
    func isPrimeSlow(num: Int) -> Bool {
        for prevNumber in 2 ..< num {
            if num % prevNumber == 0 {
                return false
            }
        }
        return true
    }
}
