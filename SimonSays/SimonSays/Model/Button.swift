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
struct Button{
    
    enum ButtonType{
        case red
        case green
        case blue
        case yellow
    }
    
    var buttonType: ButtonType
    
//    var baseColor: UIColor
//
//    var selectedColor: UIColor
    init(_ buttonType: ButtonType) {
        self.buttonType = buttonType
    }
    
//    init(_ buttonType: ButtonType,_ colorHexString: String, _ selectedColorHexString: String) {
//        self.buttonType = buttonType
//        self.baseColor = UIColor().hexStringToUIColor(hex: colorHexString)
//        self.selectedColor = UIColor().hexStringToUIColor(hex: selectedColorHexString)
//    }
}


