//
//  Button.swift
//  SimonSays
//
//  Created by Radomyr Bezghin on 3/29/21.
//

import UIKit
///
/// Represents a "Button" that is used in the "SimonSays" game
///
enum ButtonType{
    case red
    case green
    case blue
    case yellow
}
struct ButtonItem{
    
    var buttonType: ButtonType
    
    init(_ buttonType: ButtonType) {
        self.buttonType = buttonType
    }
}


