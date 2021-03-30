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
            print("game over")
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
        switch button.buttonColorType {
        case .red:
            game.chooseButton(withColorType: .red)
        case .blue:
            game.chooseButton(withColorType: .blue)
        case .green:
            game.chooseButton(withColorType: .green)
        case .yellow:
            game.chooseButton(withColorType: .yellow)
        }
    }

}

