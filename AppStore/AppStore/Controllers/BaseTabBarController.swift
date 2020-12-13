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
        
        viewControllers = [today, apps, search]

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
