//
//  SimonSays.swift
//  SimonSays
//
//  Created by Radomyr Bezghin on 3/29/21.
//

import Foundation

struct Score {
    
    var currentScore: Int
    
    var currentLevel: Int
    
    var maxScore: Int
}

class SimonSaysGame{
    
    private(set) var score: Score
    
    private(set) var currentSequence: [ButtonItem]
    
    private var userSequence: [ButtonItem]
    
    var gameOverHandler: ((_ score: Score)->Void)?
    
    var newLevelHandler: (()->Void)?
    
    init() {
        score = Score(currentScore: 0, currentLevel: 0, maxScore: 0)
        currentSequence = []
        userSequence = []
    }
    ///after user taps start new game startGame func is called
    func startGame(){
        resetData()
        currentSequence.append(pickNewRandomButtonItem())
    }
    func chooseButton(withColorType colorType: ButtonColorType) -> Bool{
        userSequence.append(ButtonItem(colorType))
        let currentIndex = userSequence.count-1
        if userSequence.count > currentSequence.count{ print("more selected");
            gameOver();
            return false
        } else if currentSequence[currentIndex] != userSequence[currentIndex] {
            print("wrong selected")
            gameOver()
            return false
        } else if userSequence.count < currentSequence.count  {
            score.currentScore += score.currentLevel * 2
        } else {
            score.currentScore += score.currentLevel * 2
            nextLevel()
        }
        return true
    }
    
    
    
    private func pickNewRandomButtonItem()->ButtonItem{
        return [ButtonItem(.red),ButtonItem(.blue),ButtonItem(.green),ButtonItem(.yellow)].randomElement()!
    }
    private func nextLevel(){
        userSequence = []
        score.currentLevel += 1
        currentSequence.append(pickNewRandomButtonItem())
        newLevelHandler?()
    }
    private func gameOver(){
        gameOverHandler?(score)
    }
    private func resetData(){
        userSequence = []
        currentSequence = []
        score.currentScore = 0
        score.currentLevel = 0
    }
    
    
}

