//
//  MenuBar.swift
//  YouTubeForMe
//
//  Created by HoThienHo on 12/17/18.
//  Copyright © 2018 hothienho. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    //let images = [#imageLiteral(resourceName: "home-3"), #imageLiteral(resourceName: "women-hairstyling"), #imageLiteral(resourceName: "subscription"), #imageLiteral(resourceName: "envelope")]
    let titleButtons = ["Recipes","Cookbooks","Likes"]
    var ProfileController : ProfileController?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      //  let x = CGFloat(indexPath.item) * self.frame.width / 4
       // leftAnchorHorizontalBar?.constant = x
       // UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut, animations: {self.layoutIfNeeded()}, completion: nil)
        ProfileController!.scrollToPage(pageIndex: indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CellMenuBar
   //     cell.imageView.image = images[indexPath.row].withRenderingMode(.alwaysTemplate)
        cell.titleLabel.text = titleButtons[indexPath.row]
        print(titleButtons[indexPath.row])
        cell.tintColor = #colorLiteral(red: 0.4876665609, green: 0.07295043629, blue: 0.004213333517, alpha: 1)
        return cell
    }
  
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.frame.width / 3, height: self.frame.height)
        print("haha")
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    var leftAnchorHorizontalBar: NSLayoutConstraint?
    func setUpHorizontalBar(){
        let horizontalBar = UIView()
        horizontalBar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(horizontalBar)
        horizontalBar.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
    
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]", options: [], metrics: nil, views: ["v0" : horizontalBar]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(2)]|", options: [], metrics: nil, views: ["v0" : horizontalBar]))
        leftAnchorHorizontalBar = horizontalBar.leftAnchor.constraint(equalTo: self.leftAnchor)
        leftAnchorHorizontalBar?.isActive = true
        horizontalBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        
    }
    let cellId = "CellIdForMenuBar"
    let selectedIndexPath = NSIndexPath(row: 0, section: 0)
    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(cv)
        cv.register(CellMenuBar.self, forCellWithReuseIdentifier: cellId)
        cv.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredVertically)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0" : cv]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0" : cv]))
       setUpHorizontalBar()
       self.cv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class CellMenuBar: BaseCell{
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: label.font.fontName, size: 18)
        return label
    }()
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
      //  imageView.frame = CGRect(x: 0, y: 0, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        return imageView
    }()
    override var isSelected: Bool{
        didSet{
            titleLabel.textColor = isSelected ? #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1): #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
    }
    override func setupViews() {
        super.setupViews()
       addSubview(titleLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(28)]", options: [], metrics: nil, views: ["v0": titleLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(100)]", options: [], metrics: nil, views: ["v0": titleLabel]))
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
}
