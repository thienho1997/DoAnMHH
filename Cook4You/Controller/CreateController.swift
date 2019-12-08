//
//  CreateController.swift
//  Cook4You
//
//  Created by HoThienHo on 11/21/19.
//  Copyright © 2019 nhom24. All rights reserved.
//

import UIKit

class CreateController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        handlePresent()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        // Do any additional setup after loading the view.
    }
    @objc func handlePresent(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let createRecipeController =  UINavigationController(rootViewController: CreateRecipe(collectionViewLayout: layout))
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
