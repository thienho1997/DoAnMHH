//
//  CollectionViewCell.swift
//  YouTubeForMe
//
//  Created by HoThienHo on 12/15/18.
//  Copyright © 2018 hothienho. All rights reserved.
//

import UIKit


class BaseCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    func setupViews(){
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewCell: BaseCell {
  
    let thumbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 22
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let tileLabel:UILabel = {
       let tileLabel = UILabel()
        tileLabel.translatesAutoresizingMaskIntoConstraints = false
        return tileLabel
    }()

    let subTitleLabel:UITextView = {
        let subtitleLabel = UITextView()
        subtitleLabel.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()
  override func setupViews(){
        
        addSubview(thumbImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(tileLabel)
        addSubview(subTitleLabel)
        let constraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: [], metrics: nil, views: ["v0":thumbImageView])
        let constraint4 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(44)]", options: [], metrics: nil, views: ["v0" : userProfileImageView])
        let constraint2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-8-[v1(44)]-12-[v2(1)]|", options: [], metrics: nil, views: ["v0":thumbImageView,"v1":userProfileImageView,"v2":separatorView])
        let constraint3 = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0" : separatorView])
       
        // topConstraint
        addConstraint(NSLayoutConstraint.init(item: tileLabel, attribute: .top, relatedBy: .equal, toItem: thumbImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint.init(item: subTitleLabel, attribute: .top, relatedBy: .equal, toItem: tileLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //leftContraint
        addConstraint(  NSLayoutConstraint.init(item: tileLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(  NSLayoutConstraint.init(item: subTitleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //rightConstraint
        addConstraint(NSLayoutConstraint.init(item: tileLabel, attribute: .right, relatedBy: .equal, toItem: thumbImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint.init(item: subTitleLabel, attribute: .right, relatedBy: .equal, toItem: thumbImageView, attribute: .right, multiplier: 1, constant: 0))
       // heightConstraint
        addConstraint(NSLayoutConstraint.init(item: tileLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        addConstraint(NSLayoutConstraint.init(item: subTitleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        NSLayoutConstraint.activate(constraint1)
        NSLayoutConstraint.activate(constraint2)
        NSLayoutConstraint.activate(constraint3)
        NSLayoutConstraint.activate(constraint4)
    }
}
