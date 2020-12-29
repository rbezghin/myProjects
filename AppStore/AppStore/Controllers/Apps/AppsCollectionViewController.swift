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
    }
}
extension AppsCollectionViewController: UICollectionViewDelegateFlowLayout{
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
}
