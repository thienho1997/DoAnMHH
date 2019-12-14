//
//  ShoppingListController.swift
//  Cook4You
//
//  Created by HoThienHo on 11/21/19.
//  Copyright © 2019 nhom24. All rights reserved.
//

import UIKit

class ShoppingListController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let longTitleLabel = UILabel()
        longTitleLabel.text = "Shopping List"
        longTitleLabel.font = UIFont.systemFont(ofSize: 22)
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        // Do any additional setup after loading the view.
        indexTabBar = 3
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
