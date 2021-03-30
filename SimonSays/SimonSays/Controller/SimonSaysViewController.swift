//
//  ViewController.swift
//  SimonSays
//
//  Created by Radomyr Bezghin on 3/28/21.
//

import UIKit
///
/// View-controller of the Simon Says game
///
class SimonSaysViewController: UIViewController {
    
    private let gameView = GameView()
    
    private let game = SimonSaysGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupGameView()
        setupGameHandlers()
    }
}
//MARK: -- Game setup
extension SimonSaysViewController{
    private func setupGameHandlers(){
        game.gameOverHandler = { [weak self] score in
            self?.displayAlertWithScore()
            self?.updateUIWithModel()
        }
        game.newLevelHandler = { [weak self] in
            self?.initiateNewLevel()
        }
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
}
//MARK: -- Game functionality
extension SimonSaysViewController {
    @objc private func didTapSimonButton(_ sender: AnyObject){
        guard let button = sender as? SimonButton else {return}
        game.chooseButton(withColorType: button.buttonColorType)
        updateUIWithModel()
    }
    @objc private func didTapNewGameButton(){
        game.startGame()
        updateUIWithModel()
        initiateNewLevel()
    }
    ///calls show button sequesnce on the global queue, since showButtonsSequence uses sleep between button calls we dont want to block main queue
    private func initiateNewLevel(){
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 1){
            self.showButtonsSequence(self.game.currentSequence)
        }
    }
    ///shows sequence of buttons with pauses in between
    private func showButtonsSequence(_ buttonsSequence: [ButtonItem]){
        for button in buttonsSequence {
            if !game.isGameRunning{return}
            //changes color
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
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(.error)

        let alert = UIAlertController(title: "Game Over!",
                                      message: "Your current score is: \(game.score.currentScore)",
                                      preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .cancel, handler: { (alertAction) in
            self.gameView.newGameUI()
        }))
        self.present(alert, animated: true)
    }
    private func updateUIWithModel(){
        gameView.updateUIWith(score: game.score)
    }
}
