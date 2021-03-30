//
//  Score.swift
//  SimonSays
//
//  Created by Radomyr Bezghin on 3/30/21.
//

import Foundation

struct Score {
    
    private(set) var currentScore: Int {
        didSet{
            if maxScore < currentScore{
                maxScore = currentScore
            }
        }
    }
    
    private(set) var currentLevel: Int
    
    private(set) var maxScore: Int
    
    mutating func resetScore() {
        currentScore = 0
        currentLevel = 1
    }
    mutating func nextLevel(){
        currentLevel += 1
    }
    mutating func addScore(){
        currentScore += currentLevel * 2
    }
}
