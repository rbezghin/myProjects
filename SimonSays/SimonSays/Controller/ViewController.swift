//
//  ViewController.swift
//  SimonSays
//
//  Created by Radomyr Bezghin on 3/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    let gameView = GameView()
    
    let game = SimonSays()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupGameView()
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
        //game.start()
        DispatchQueue.global(qos: .userInteractive).async {
            self.showButtonsSequence([ButtonItem(.red), ButtonItem(.green), ButtonItem(.blue), ButtonItem(.yellow)])
        }
    }

}

