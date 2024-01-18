//
//  TabBarViewController.swift
//  Flo
//
//  Created by Darya on 17.01.24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.2900692821, green: 0.2900692821, blue: 0.2900692821, alpha: 1)
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.barTintColor = .clear
        setupTabBar()
    }
    
   func setupTabBar() {
        
        let todayViewController = createNavigationController(vc: TodayViewController(), itemName: "Сегодня", itemImage: UIImage(systemName: "calendar")!)
        let articlesViewController = createNavigationController(vc: ArticlesViewController(), itemName: "Статьи", itemImage: UIImage(systemName: "book.pages")!)
       
        viewControllers = [todayViewController, articlesViewController]
        selectedViewController = todayViewController

    }
    
    private func createNavigationController(vc: UIViewController, itemName: String, itemImage: UIImage) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: itemImage.withAlignmentRectInsets(.init(top: 15, left: 0, bottom: 0, right: 0)), tag: 0)
        
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem = item
        
        return navigationController
    }
}
