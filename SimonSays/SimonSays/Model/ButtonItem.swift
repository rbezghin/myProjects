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

enum ButtonColorType{
    case red
    case green
    case blue
    case yellow
}
///ButtonItem is redundant, but maybe useful for the future functionality
struct ButtonItem: Equatable{
    static func == (lhs: ButtonItem, rhs: ButtonItem) -> Bool {
        return lhs.buttonType == rhs.buttonType
    }
    
    var buttonType: ButtonColorType
    
    init(_ buttonType: ButtonColorType) {
        self.buttonType = buttonType
    }
}


