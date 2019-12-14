//
//  CreateRecipe1.swift
//  Cook4You
//
//  Created by HoThienHo on 12/9/19.
//  Copyright © 2019 nhom24. All rights reserved.
//

import UIKit
class CreateRecipe1: BaseCell{
    let introduceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9607843137, blue: 0.9411764706, alpha: 1)
        return view
    }()
    let introLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    let contentV: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        return view
    }()
    let testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "this is test label"
        label.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    override func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        print(self.frame.height)
        let scrollView = UIScrollView(frame: CGRect(x: 0, y:0 , width: self.frame.width , height: self.frame.height))
        let containerView1 = UIView()
        scrollView.addSubview(containerView1)
        scrollView.contentSize = CGSize(width: self.frame.width, height: 1074)
        addSubview(scrollView)
         containerView1.addSubview(introduceView)
        scrollView.isScrollEnabled = true
        
       
      
        containerView1.backgroundColor = #colorLiteral(red: 0.176470592617989, green: 0.498039215803146, blue: 0.756862759590149, alpha: 1.0)
        scrollView.addSubview(containerView1)
        containerView1.translatesAutoresizingMaskIntoConstraints = false
        
        // This is key:  connect all four edges of the containerView to
        // to the edges of the scrollView
        containerView1.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        containerView1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        containerView1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        // Making containerView and scrollView the same height means the
        // content will not scroll vertically
        containerView1.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        
        
   // addSubview(testView)
        introduceView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        introduceView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        introduceView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        introduceView.heightAnchor.constraint(equalToConstant: 74).isActive = true
        
        
        introduceView.addSubview(introLabel)
       introduceView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]|", options: [], metrics: nil, views: ["v0": introLabel]))
       introduceView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0": introLabel]))
        
        containerView1.addSubview(contentV)
            contentV.topAnchor.constraint(equalTo: introduceView.bottomAnchor, constant: 0).isActive = true
            contentV.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            contentV.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            contentV.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        contentV.addSubview(testLabel)
        testLabel.bottomAnchor.constraint(equalTo: contentV.bottomAnchor, constant: -8).isActive = true
        testLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        testLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        testLabel.leftAnchor.constraint(equalTo: contentV.leftAnchor, constant: 8).isActive = true
    }
}
