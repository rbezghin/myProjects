//
//  AppsGroupCell.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/15/20.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let cellID = "AppsGroupCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
