//
//  CreateController.swift
//  Cook4You
//
//  Created by HoThienHo on 11/21/19.
//  Copyright © 2019 nhom24. All rights reserved.
//

import UIKit

class CreateController: UIViewController {
     var customTabBarController: CustomTabBarController?
    
    override func viewWillAppear(_ animated: Bool) {
        handlePresent()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        // Do any additional setup after loading the view.
    }
    @objc func handlePresent(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let createRecipeNonNav = CreateRecipe(collectionViewLayout: layout)
        let createRecipeController =  UINavigationController(rootViewController: createRecipeNonNav )
       // createRecipeController.toolbar.translatesAutoresizingMaskIntoConstraints = false
        createRecipeNonNav.customTabBarController1 = customTabBarController
        self.present(createRecipeController, animated: true, completion: nil)
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
