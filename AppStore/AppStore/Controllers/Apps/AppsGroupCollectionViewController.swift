//
//  AppsGroupCollectionViewController.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/15/20.
//

import UIKit

class AppsGroupCollectionViewCcontroller: BaseCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell().cellID)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
}
extension AppsGroupCollectionViewCcontroller: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width - 20, height: 45)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell().cellID, for: indexPath) as! AppsGroupCell
        cell.backgroundColor = .red
        return cell
    }
}
