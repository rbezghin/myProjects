//
//  AppsCollectionViewController.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/13/20.
//

import UIKit

class AppsCollectionViewController: BaseCollectionViewController {
    
    let cellID = "appsCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewController()
    }
    
    private func setupCollectionViewController(){
        collectionView.backgroundColor = .white
        collectionView.register(AppsCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(AppsSupplementaryHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:   AppsSupplementaryHeaderView.headerID)
    }
}
extension AppsCollectionViewController: UICollectionViewDelegateFlowLayout{
    
    //MARK: cells setup
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width, height: 300)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsCollectionViewCell
        //cell.backgroundColor = .red
        return cell
    }
    
    //MARK: supplementary header setup
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsSupplementaryHeaderView.headerID, for: indexPath)
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 350)
    }
}
