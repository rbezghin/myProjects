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
struct ButtonItem: Equatable{
    
    var buttonType: ButtonColorType
    
    init(_ buttonType: ButtonColorType) {
        self.buttonType = buttonType
    }
    static func == (lhs: ButtonItem, rhs: ButtonItem) -> Bool {
        return lhs.buttonType == rhs.buttonType
    }
}
enum ButtonColorType{
    case red
    case green
    case blue
    case yellow
}

