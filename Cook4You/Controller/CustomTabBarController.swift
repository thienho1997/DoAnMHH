//
//  CustomTabBarControllerViewController.swift
//  Cook4You
//
//  Created by HoThienHo on 11/21/19.
//  Copyright © 2019 nhom24. All rights reserved.
//

import UIKit
var indexTabBar = 0
class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeController = HomeController()
        let homeNaviController = UINavigationController(rootViewController: homeController)
        homeNaviController.title = "Home"
        homeNaviController.tabBarItem.image = #imageLiteral(resourceName: "home (2)")
        
        let searchController = SearchController()
        let searchNaviController = UINavigationController(rootViewController: searchController)
        searchNaviController.title = "Search"
        searchNaviController.tabBarItem.image = #imageLiteral(resourceName: "magnifying-glass (1)")
        
        let createNaviController = CreateController()
        createNaviController.customTabBarController = self
         createNaviController.title = "Create"
         createNaviController.tabBarItem.image = #imageLiteral(resourceName: "plus (1)")
        
        let shoppingListController = ShoppingListController()
        let shoppingListNaviController = UINavigationController(rootViewController: shoppingListController)
        shoppingListNaviController.title = "S hoppingList"
        shoppingListNaviController.tabBarItem.image = #imageLiteral(resourceName: "to-do")
        
        //let profileController = ProfileController()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let profileNaviController =  UINavigationController(rootViewController: ProfileController(collectionViewLayout: layout))
        
        profileNaviController.title = "Profile"
        profileNaviController.tabBarItem.image = #imageLiteral(resourceName: "avatar")
        
        self.viewControllers = [homeNaviController,searchNaviController, createNaviController,shoppingListNaviController,profileNaviController]
        self.tabBar.tintColor = #colorLiteral(red: 0.1005001575, green: 0.2521012932, blue: 0.564978585, alpha: 1)
        self.tabBar.isTranslucent = false
        self.selectedIndex = 0
        
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
