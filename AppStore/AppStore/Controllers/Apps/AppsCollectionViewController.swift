//
//  AppsCollectionViewController.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/13/20.
//

import UIKit

class AppsCollectionViewController: UICollectionViewController {
    
    let cellID = "appsCell"
    
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        return .init(width: self.view.frame.width, height: 250)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
}
