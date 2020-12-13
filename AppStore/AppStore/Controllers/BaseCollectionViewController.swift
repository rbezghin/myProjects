//
//  BaseCollectionViewController.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/13/20.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
