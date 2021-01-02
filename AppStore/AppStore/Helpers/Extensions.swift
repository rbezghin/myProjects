//
//  Extensions.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 1/2/21.
//

import UIKit

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
extension UIButton{
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}
extension UILabel{
    convenience init(text: String, font: UIFont) {
        self.init()
        self.text = text
        self.font = font
    }
}
