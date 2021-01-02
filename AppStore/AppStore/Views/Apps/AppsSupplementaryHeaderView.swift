//
//  AppsSupplementaryHeaderView.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 1/2/21.
//

import UIKit

class AppsSupplementaryHeaderView: UICollectionReusableView {
    
    static let headerID = "AppsSupplementaryHeaderView"
    
    let headerController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerController.view)
        headerController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
