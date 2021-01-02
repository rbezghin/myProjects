//
//  AppsHeaderHorizontalController.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 1/2/21.
//

import UIKit

class AppsHeaderHorizontalController: BaseCollectionViewController {
    override func viewDidLoad() {
        setupController()
    }
    private func setupController(){
        collectionView.backgroundColor = .white
        collectionView.register(AppsSupplementaryViewCell.self, forCellWithReuseIdentifier: AppsSupplementaryViewCell.cellID)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
}
extension AppsHeaderHorizontalController: UICollectionViewDelegateFlowLayout{
    
    //MARK: cells setup
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width-50, height: self.view.frame.height)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: AppsSupplementaryViewCell.cellID, for: indexPath) as! AppsSupplementaryViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 0)
    }
}
