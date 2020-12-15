//
//  BaseTabBarController.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 11/30/20.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //create today, apps, search
        let today = createNavController(viewController: UIViewController(), title: "Today", imageName: "newspaper")
        let apps = createNavController(viewController: AppsCollectionViewController(), title: "Apps", imageName: "gamecontroller")
        let search = createNavController(viewController: SearchCollectionViewController(), title: "Search", imageName: "magnifyingglass")
        
        viewControllers = [apps, today, search]

    }
    
    private func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController{
        let navc = UINavigationController(rootViewController: viewController)
        navc.tabBarItem.image = UIImage(systemName: imageName)
        navc.tabBarItem.title = title
        navc.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        return navc
    }
}
