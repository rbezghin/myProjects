//
//  SimonButton.swift
//  SimonSays
//
//  Created by Radomyr Bezghin on 3/29/21.
//

import UIKit
///
///Custom UIButton that supports changing background color when its highlighted vs not highlighted
///also it has button type to differenciate between different buttons red vs blue etc..
///
class SimonButton: UIButton {
    
    let buttonColorType: ButtonColorType
    
    let mainColor: UIColor
    
    let secondaryColor: UIColor
    
    required init(_ mainColor: UIColor, _ secondaryColor: UIColor, _ type: ButtonColorType) {
        self.buttonColorType = type
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
        super.init(frame: .zero)
        self.backgroundColor = mainColor
        self.layer.cornerRadius = Constants.cornerRadius
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? secondaryColor : mainColor
        }
    }
}
