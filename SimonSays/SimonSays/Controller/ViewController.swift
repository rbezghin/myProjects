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
        //game.start()
    }
    private func setupGameView(){
        self.view.addSubview(gameView)
        gameView.addAnchors(top: self.view.topAnchor,
                            leading: self.view.leadingAnchor,
                            bottom: self.view.bottomAnchor,
                            trailing: self.view.trailingAnchor)
    }

}

