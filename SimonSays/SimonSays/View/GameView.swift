//
//  GameView.swift
//  SimonSays
//
//  Created by Radomyr Bezghin on 3/29/21.
//

import UIKit

class GameView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    ///to set constraints relative to the frame size
    override func layoutSubviews() {
        super.layoutSubviews()
        stack.heightAnchor.constraint(equalToConstant: self.frame.width * 0.7).isActive = true
        stack.widthAnchor.constraint(equalToConstant: self.frame.width * 0.7).isActive = true
    }
    
    let newGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("New game", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(didTapNewGameButton), for: .touchUpInside)
        return button
    }()
    let highScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "High score: 123"
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: 0"
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    let levelLabel: UILabel = {
        let label = UILabel()
        label.text = "Level: 1"
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    let redButton: SimonButton = {
        let button = SimonButton(.red, .orange, .red)
        return button
    }()
    let blueButton: SimonButton = {
        let button = SimonButton(.blue, .orange, .blue)
        return button
    }()
    let greenButton: UIButton = {
        let button = SimonButton(.green, .orange, .green)
        return button
    }()
    let yellowButton: UIButton = {
        let button = SimonButton(.yellow, .orange, .yellow)
        return button
    }()

}
//MARK: -- UI setup
extension GameView {
    private func setupSubViews(){
        
        self.backgroundColor = .white
    
        //Buttons
        let firstRowStack = UIStackView(arrangedSubviews: [redButton, blueButton])
        firstRowStack.axis = .horizontal
        firstRowStack.distribution = .fillEqually
        firstRowStack.spacing = 10
   
        let secondRowStack = UIStackView(arrangedSubviews: [greenButton, yellowButton])
        secondRowStack.axis = .horizontal
        secondRowStack.distribution = .fillEqually
        secondRowStack.spacing = 10
        
        
        stack.addArrangedSubview(firstRowStack)
        stack.addArrangedSubview(secondRowStack)
        
        self.addSubview(stack)
        stack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        //Score labels
        let scoreLevelStack = UIStackView(arrangedSubviews: [levelLabel, highScoreLabel,scoreLabel])
        scoreLevelStack.axis = .horizontal
        scoreLevelStack.distribution = .fillEqually
        scoreLevelStack.spacing = 10
        
        self.addSubview(scoreLevelStack)
        scoreLevelStack.addAnchors(top: nil,
                                 leading: stack.leadingAnchor,
                                 bottom: stack.topAnchor,
                                 trailing: stack.trailingAnchor,
                                 padding: .init(top: 0, left: 0, bottom: 10, right: 0),
                                 size: .init(width: 0, height: 0))
        
        //New game button
        self.addSubview(newGameButton)
        newGameButton.addAnchors(top: stack.bottomAnchor,
                                 leading: stack.leadingAnchor,
                                 bottom: nil,
                                 trailing: stack.trailingAnchor,
                                 padding: .init(top: 10, left: 0, bottom: 0, right: 0),
                                 size: .init(width: 0, height: 60))
        
    }
}
//MARK: -- helper functions
extension GameView{
    func setNewHighScore(_ score: Int){
        highScoreLabel.text = "High score: \(score)"
    }
    func setScore(_ score: Int){
        scoreLabel.text = "Score: \(score)"
    }
    func setLevel(_ level: Int){
        levelLabel.text = "Level: \(level)"
    }
    ///when new game button was tapped, hide new game button and high score label
    func inGameUI(){
        highScoreLabel.isHidden = true
        newGameButton.isHidden = true
        
        levelLabel.isHidden = false
        scoreLabel.isHidden = false
    }
    ///before new game button was tapped show new game button and high score if it exists
    func newGameUI(){
        levelLabel.isHidden = true
        scoreLabel.isHidden = true
        
        highScoreLabel.isHidden = false
        newGameButton.isHidden = false
    }
    @objc func didTapNewGameButton(){
        inGameUI()
    }
    func highlightButton(_ buttonType: ButtonColorType){
        switch buttonType {
        case .red:
            redButton.isHighlighted.toggle()
        case .blue:
            blueButton.isHighlighted.toggle()
        case .green:
            greenButton.isHighlighted.toggle()
        case .yellow:
            yellowButton.isHighlighted.toggle()
        }
    }
    func updateScore(_ score: Int, _ level: Int){
        scoreLabel.text = "Score: \(score)"
        levelLabel.text = "Level: \(level)"
    }

}


//extension UIButton {
//
//  /// Sets the background color to use for the specified button state.
//    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
//
//        let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)
//
//        UIGraphicsBeginImageContext(minimumSize)
//
//        if let context = UIGraphicsGetCurrentContext() {
//          context.setFillColor(color.cgColor)
//          context.fill(CGRect(origin: .zero, size: minimumSize))
//        }
//
//        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        self.clipsToBounds = true
//        self.setBackgroundImage(colorImage, for: forState)
//    }
//}
