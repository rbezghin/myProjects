//
//  ParkingSystem.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/8/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

class ParkingSystem {
    
    var carSpots = [Int: Int]()
    
    init(_ big: Int, _ medium: Int, _ small: Int) {
        carSpots[1] = big
        carSpots[2] = medium
        carSpots[3] = small
    }
    
    func addCar(_ carType: Int) -> Bool {
        let spots = carSpots[carType]!
        if spots > 0 {
            carSpots[carType]! -= 1
        } else {
            return false
        }
        return true
    }
}


