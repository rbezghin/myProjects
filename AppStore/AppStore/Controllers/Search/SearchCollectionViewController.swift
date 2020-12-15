//
//  CollectionViewController.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/1/20.
//

import UIKit



class SearchCollectionViewController: BaseCollectionViewController, UISearchBarDelegate {
    
    private let reuseIdentifier = "Cell"
    
    var results = [Result]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        // Register cell classes
        self.collectionView!.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        setupSearchBar()
    }
    
    private func setupSearchBar(){
        definesPresentationContext = true
        navigationItem.searchController = searchController
        //navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    
    var timer = Timer()
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false, block: { (_) in
            Service.shared.fetchSearchedApps(searchTerm: searchText) { (results, error) in
                if let results = results{
                    self.results = results
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                } else {
                    print("error loading data \(error)")
                }
            }
        })

    }
}
// MARK: UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 350)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchResultCollectionViewCell
        cell.result = results[indexPath.item]
        return cell
    }
}

