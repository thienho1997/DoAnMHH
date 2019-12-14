//
//  HomeControllerViewController.swift
//  Cook4You
//
//  Created by HoThienHo on 11/21/19.
//  Copyright © 2019 nhom24. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let longTitleLabel = UILabel()
        longTitleLabel.text = "Home"
        longTitleLabel.font = UIFont.systemFont(ofSize: 22)
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        // Do any additional setup after loading the view.
        indexTabBar = 0
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
