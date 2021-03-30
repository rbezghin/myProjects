//
//  ViewController.swift
//  SimonSays
//
//  Created by Radomyr Bezghin on 3/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    let gameView = GameView()
    
    let game = SimonSaysGame()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupGameView()
        game.gameOverHandler = { [weak self] score in
            self?.displayAlertWithScore()
        }
        game.newLevelHandler = { [weak self] in
            self?.initiateNewLevel()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    private func setupGameView(){
        self.view.addSubview(gameView)
        gameView.addAnchors(top: self.view.topAnchor,
                            leading: self.view.leadingAnchor,
                            bottom: self.view.bottomAnchor,
                            trailing: self.view.trailingAnchor)
        
        gameView.newGameButton.addTarget(self, action: #selector(didTapNewGameButton), for: .touchUpInside)
        
        gameView.redButton.addTarget(self, action: #selector(didTapSimonButton( _:)), for: .touchUpInside)
        gameView.blueButton.addTarget(self, action: #selector(didTapSimonButton( _:)), for: .touchUpInside)
        gameView.greenButton.addTarget(self, action: #selector(didTapSimonButton( _:)), for: .touchUpInside)
        gameView.yellowButton.addTarget(self, action: #selector(didTapSimonButton( _:)), for: .touchUpInside)
    }
    private func showButtonsSequence(_ buttonsSequence: [ButtonItem]){
        for button in buttonsSequence {
            //change color
            DispatchQueue.main.async {
                self.gameView.highlightButton(button.buttonType)
            }
            sleep(1)
            DispatchQueue.main.async {
                self.gameView.highlightButton(button.buttonType)
            }
            sleep(1)
        }
    }
    private func displayAlertWithScore(){
        let alert = UIAlertController(title: "Game Over!", message: "Your current score is: \(game.score.currentScore)", preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .cancel, handler: { (alertAction) in
            print("dissmissed!")
            self.gameView.newGameUI()
        }))
        self.present(alert, animated: true)
    }
    @objc private func didTapNewGameButton(){
        game.startGame()
        initiateNewLevel()
    }
    private func initiateNewLevel(){
        DispatchQueue.global(qos: .userInteractive).async {
            print(self.game.currentSequence)
            self.showButtonsSequence(self.game.currentSequence)
        }
    }
    @objc private func didTapSimonButton(_ sender: AnyObject){
        guard let button = sender as? SimonButton else {return}
        game.chooseButton(withColorType: button.buttonColorType)
        gameView.updateScore(game.score.currentScore, game.score.currentLevel)
    }

}

