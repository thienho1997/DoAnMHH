//
//  CreateRecipeCollectionViewController.swift
//  Cook4You
//
//  Created by HoThienHo on 12/7/19.
//  Copyright © 2019 nhom24. All rights reserved.
//

import UIKit


class CreateRecipe: UICollectionViewController, UICollectionViewDelegateFlowLayout {
     let colorsForTestCell:[UIColor] = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)]
    let viewForProcessBar: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    let viewForProcessBarAnimation: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        return view
    }()
    let lineSeparated1: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    let lineSeparated2: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    let lineSeparated3: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    let lineSeparated4: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    let lineSeparated5: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = UIColor.white
        self.collectionView.isPagingEnabled = true
        self.collectionView.register(RecipeInput1.self, forCellWithReuseIdentifier: "CellId")
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        titleLabel.text = "Create Recipe"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 21)
        self.navigationItem.titleView = titleLabel
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.toolbar.isTranslucent = false
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.isScrollEnabled = false
        setUpProcessBar()
        setUpToolbar()
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = colorsForTestCell[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: view.frame.width, height: view.frame.height)
        return size
    }
    var indexRow = 0;
    @objc func nextItem(){
        if(indexRow == colorsForTestCell.count - 1) {return}
        indexRow = indexRow + 1
        let index = IndexPath(row: indexRow, section: 0)
        self.collectionView.scrollToItem(at: index, at: UICollectionView.ScrollPosition.left, animated: true)
    }
    @objc func backItem(){
        if(indexRow<=0) {return}
        indexRow = indexRow - 1
        let index = IndexPath(row: indexRow, section: 0)
        self.collectionView.scrollToItem(at: index, at: UICollectionView.ScrollPosition.left, animated: true)
    }
    func setUpToolbar(){
        let buttonNext = UIView(frame: CGRect(x: 0, y: 0, width: 170, height: 40))
        buttonNext.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        buttonNext.layer.cornerRadius = 5
        buttonNext.clipsToBounds = true
        let labelNext = UILabel(frame: CGRect(x: buttonNext.frame.origin.x, y: buttonNext.frame.origin.y, width: buttonNext.frame.width * 0.48, height: buttonNext.frame.height))
        labelNext.text = "Next"
        labelNext.textAlignment = .right
       // labelNext.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        labelNext.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        labelNext.font = UIFont.boldSystemFont(ofSize: 18)
        let imageViewNext = UIImageView(frame: CGRect(x: buttonNext.frame.origin.x + buttonNext.frame.width * 0.5 , y: buttonNext.frame.origin.y +  buttonNext.frame.height * 0.24 , width: buttonNext.frame.width * 0.17, height: buttonNext.frame.height * 0.52))
        imageViewNext.image = #imageLiteral(resourceName: "right-chevron")
       // imageViewNext.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        buttonNext.addSubview(labelNext)
        buttonNext.addSubview(imageViewNext)
        labelNext.rightAnchor.constraint(equalTo: buttonNext.centerXAnchor, constant: 0).isActive = true
        labelNext.centerYAnchor.constraint(equalTo: buttonNext.centerYAnchor).isActive = true
        labelNext.widthAnchor.constraint(equalToConstant: 50).isActive = true
        labelNext.heightAnchor.constraint(equalToConstant: 20).isActive = true
        let barButtonNext = UIBarButtonItem(customView: buttonNext)
        
        let buttonBack = UIView(frame: CGRect(x: 0, y: 0, width: 170, height: 40))
        buttonBack.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonBack.layer.cornerRadius = 5
        buttonBack.clipsToBounds = true
        buttonBack.layer.borderWidth = 1
        buttonBack.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        let imageViewBack = UIImageView(frame: CGRect(x: buttonNext.frame.origin.x + buttonBack.frame.width * 0.3 , y: buttonBack.frame.origin.y +  buttonBack.frame.height * 0.24 , width: buttonBack.frame.width * 0.17, height: buttonBack.frame.height * 0.52))
        imageViewBack.image = #imageLiteral(resourceName: "left-arrow (1)").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        imageViewBack.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        let labelBack = UILabel(frame: CGRect(x: buttonBack.frame.origin.x + buttonBack.frame.width * 0.52, y: buttonBack.frame.origin.y, width: buttonBack.frame.width * 0.48, height: buttonBack.frame.height))
        labelBack.text = "Back"
        labelBack.textAlignment = .left
        // labelNext.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        labelBack.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        labelBack.font = UIFont.boldSystemFont(ofSize: 18)
        buttonBack.addSubview(labelBack)
        buttonBack.addSubview(imageViewBack)
        let barButtonBack = UIBarButtonItem(customView: buttonBack)
        var items = [UIBarButtonItem]()
       
    barButtonNext.customView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextItem)))
     barButtonBack.customView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backItem)))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        flexibleSpace.width = 10
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil
            , action: nil)
        fixedSpace.width = 10
        
        items.append(flexibleSpace)
        items.append(barButtonBack)
        items.append(fixedSpace)
        items.append(barButtonNext)
        items.append(flexibleSpace)
        self.toolbarItems = items
    }
    var rightAnchorProcessBarAnimation: NSLayoutConstraint?
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
      rightAnchorProcessBarAnimation?.constant = scrollView.contentOffset.x / 6 + view.frame.maxX  / 6
    }
    func setUpProcessBar(){
        self.view.addSubview(viewForProcessBar)
        self.view.addSubview(viewForProcessBarAnimation)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(6)]", options:[] , metrics: nil, views: ["v0":viewForProcessBarAnimation]))
         let w = view.frame.width / 6
        rightAnchorProcessBarAnimation = viewForProcessBarAnimation.rightAnchor.constraint(equalTo: view.leftAnchor, constant: w)
        rightAnchorProcessBarAnimation?.isActive = true
        viewForProcessBarAnimation.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options:[] , metrics: nil, views: ["v0":viewForProcessBar]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(6)]", options:[] , metrics: nil, views: ["v0":viewForProcessBar]))
//        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
//            (self.navigationController?.navigationBar.frame.height ?? 0.0)
       
        self.view.addSubview(lineSeparated1)
        lineSeparated1.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: w).isActive = true
        lineSeparated1.widthAnchor.constraint(equalToConstant:1).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(6)]", options:[] , metrics: nil, views: ["v0":lineSeparated1]))
        
        self.view.addSubview(lineSeparated2)
        lineSeparated2.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: w*2).isActive = true
        lineSeparated2.widthAnchor.constraint(equalToConstant:1).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(6)]", options:[] , metrics: nil, views: ["v0":lineSeparated2]))
        
        self.view.addSubview(lineSeparated3)
        lineSeparated3.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: w*3).isActive = true
        lineSeparated3.widthAnchor.constraint(equalToConstant:1).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(6)]", options:[] , metrics: nil, views: ["v0":lineSeparated3]))
        
        self.view.addSubview(lineSeparated4)
        lineSeparated4.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: w*4).isActive = true
        lineSeparated4.widthAnchor.constraint(equalToConstant:1).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(6)]", options:[] , metrics: nil, views: ["v0":lineSeparated4]))
        
        self.view.addSubview(lineSeparated5)
        lineSeparated5.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: w*5).isActive = true
        lineSeparated5.widthAnchor.constraint(equalToConstant:1).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(6)]", options:[] , metrics: nil, views: ["v0":lineSeparated5]))
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let height = 6
        self.collectionView.contentInset = UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0)
        self.collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0)
        
    }
}
class RecipeInput1: BaseCell{
    override func setupViews() {
    }
}
