//
//  ProfileDetail.swift
//  Cook4You
//
//  Created by HoThienHo on 12/7/19.
//  Copyright © 2019 nhom24. All rights reserved.
//

import UIKit

class ProfileDetail: UIView {
    let imageProfile:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        label.text = "I'm Tiger"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    let levelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        label.text = "Community"
        label.font = UIFont(name: label.font.fontName, size: 16)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    let editProfileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.layer.borderWidth = 1
        button.setTitle("Edit Profile", for: UIControl.State.normal)
        button.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addSubview(imageProfile)
        imageProfile.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        imageProfile.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        imageProfile.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageProfile.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: imageProfile.rightAnchor, constant: 12).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addSubview(levelLabel)
        levelLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        levelLabel.leftAnchor.constraint(equalTo: imageProfile.rightAnchor, constant: 12).isActive = true
        levelLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        levelLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addSubview(editProfileButton)
        editProfileButton.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 12).isActive = true
        editProfileButton.leftAnchor.constraint(equalTo: imageProfile.rightAnchor, constant: 12).isActive = true
        editProfileButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        editProfileButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
