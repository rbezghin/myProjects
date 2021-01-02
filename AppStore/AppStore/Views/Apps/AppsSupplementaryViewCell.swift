//
//  AppsSupplementaryViewCell.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 1/2/21.
//

import UIKit

class AppsSupplementaryViewCell: UICollectionViewCell {
    
    static let cellID = "AppsSupplementaryViewCell"
    
    let companyLabel = UILabel(text: "Facebook", font: UIFont.systemFont(ofSize: 14))
    
    let infoLabel = UILabel(text: "Our company give zero ducks about you and your privacy!", font: UIFont.systemFont(ofSize: 24))
    
    let cellImageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellImageView.backgroundColor = .purple
        infoLabel.numberOfLines = 3
        companyLabel.textColor = .blue
        
        
        let stack = VerticalStackView(arrangedSubviews: [companyLabel,infoLabel,cellImageView])
        stack.spacing = 10
        contentView.addSubview(stack)
        stack.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
