//
//  AppsGroupCell.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/15/20.
//

import UIKit


class AppsGroupCell: UICollectionViewCell {
    
    let cellID = "AppsGroupCell"
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLabel = UILabel(text: "App name", font: UIFont.systemFont(ofSize: 16))
    
    let companyLabel = UILabel(text: "Company", font: UIFont.systemFont(ofSize: 14))
    
    let getButton = UIButton(title: "GET")
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView.backgroundColor = .red
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        getButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        getButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        getButton.layer.cornerRadius = 32/2
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        companyLabel.textColor = .lightGray
        
        
        let nameCompanyStack = UIStackView(arrangedSubviews: [nameLabel, companyLabel])
        nameCompanyStack.axis = .vertical
        
        let stack = UIStackView(arrangedSubviews: [imageView, nameCompanyStack, getButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 15
        
        contentView.addSubview(stack)
        stack.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
