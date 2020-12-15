//
//  BaseCollectionViewController.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/15/20.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
