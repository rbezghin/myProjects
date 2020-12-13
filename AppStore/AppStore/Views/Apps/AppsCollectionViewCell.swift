//
//  AppsCollectionViewCell.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/13/20.
//

import UIKit
import SDWebImage

class AppsCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
