//
//  SimonSays.swift
//  SimonSays
//
//  Created by Radomyr Bezghin on 3/29/21.
//

import Foundation
///
/// Models a "SimonSays" game
/// In SimonSays you need to remember the sequence in which 4 colored buttons are highlighted
/// Game starts with 1 button and with every successful try it adds +1 button.
/// SimonSaysGame is build with Score mode and ButtonItem model
/// Score is calculated depending on what level it is and ButtonItem stores type of the button highlighted
/// Whenever a change in game status occurs that change is notified via closures gameOverHandler & newLevelHandler
///
class SimonSaysGame{
    ///used to determined whether game is still running or is in undefined state
    private(set) var isGameRunning = false
    ///data related to score/maxscore/level
    private(set) var score: Score
    ///randomly generated sequence
    private(set) var currentSequence: [ButtonItem]
    ///used entered sequence
    private var userSequence: [ButtonItem]
    ///when game is over controller must be notified to make updates
    var gameOverHandler: ((_ score: Score)->Void)?
    ///when user entered correct sequence new level notification is sent to the vc
    var newLevelHandler: (()->Void)?
    
    init() {
        score = Score(currentScore: 0, currentLevel: 1, maxScore: 0)
        currentSequence = []
        userSequence = []
    }
}
//MARK: -- game management
extension SimonSaysGame{
    ///after user taps start new game startGame func is called
    func startGame(){
        isGameRunning = true
        resetData()
        currentSequence.append(pickNewRandomButtonItem())
    }
    ///when user taps a button it is matched with randomly generated sequence
    func chooseButton(withColorType colorType: ButtonColorType){
        userSequence.append(ButtonItem(colorType))
        let currentIndex = userSequence.count-1
        if userSequence.count > currentSequence.count || currentSequence[currentIndex] != userSequence[currentIndex]{
            gameOver()
        } else if userSequence.count < currentSequence.count  {
            score.addScore()
        } else {
            score.addScore()
            nextLevel()
        }
    }
}
//MARK: -- game helper functions
extension SimonSaysGame {
    private func nextLevel(){
        userSequence = []
        score.nextLevel()
        currentSequence.append(pickNewRandomButtonItem())
        newLevelHandler?()
    }
    private func gameOver(){
        isGameRunning = false
        gameOverHandler?(score)
    }
    private func resetData(){
        userSequence = []
        currentSequence = []
        score.resetScore()
    }
    private func pickNewRandomButtonItem()->ButtonItem{
        return [ButtonItem(.red),ButtonItem(.blue),ButtonItem(.green),ButtonItem(.yellow)].randomElement()!
    }
}

