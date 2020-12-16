//
//  AppsCollectionViewCell.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/13/20.
//

import UIKit
//import SDWebImage

class AppsCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "App section"
        return label
    }()
    
    let horizontalController = AppsGroupCollectionViewCcontroller()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        
        self.addSubview(titleLabel)
        self.addSubview(horizontalController.view)
        
        titleLabel.anchor(top: self.topAnchor,
                          leading: self.leadingAnchor,
                          bottom: nil,
                          trailing: self.trailingAnchor,
                          padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        horizontalController.view.anchor(top: titleLabel.bottomAnchor,
                          leading: self.leadingAnchor,
                          bottom: self.bottomAnchor,
                          trailing: self.trailingAnchor,
                          padding: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
