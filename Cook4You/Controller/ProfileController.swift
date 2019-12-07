//
//  ViewController.swift
//  YouTubeForMe
//
//  Created by HoThienHo on 12/15/18.
//  Copyright © 2018 hothienho. All rights reserved.
//

import UIKit

class ProfileController:UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // navigationItem.title = "Home"
       self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        titleLabel.text = "Profile"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.navigationItem.titleView = titleLabel
     self.collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true
    //   self.navigationController?.navigationBar.barStyle = .blackTranslucent
       self.collectionView.register(Test.self, forCellWithReuseIdentifier: "CellId")
    // remove hor.. line navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    // hide scroll bar
        self.collectionView.showsHorizontalScrollIndicator = false
        
        setUpProfileDetailView()
        setUpMenuBar()
        setNavBar()
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    let colorsForTestCell:[UIColor] = [#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! Test
//        cell.video = videos[indexPath.row]
        
        cell.backgroundColor = colorsForTestCell[indexPath.row]
        return cell
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
       menuBar.leftAnchorHorizontalBar?.constant = scrollView.contentOffset.x / 3
       
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let indexPa = IndexPath(row: Int(targetContentOffset.pointee.x / view.frame.width), section: 0)
        menuBar.cv.selectItem(at: indexPa, animated: true, scrollPosition: .centeredHorizontally)
    }
    func scrollToPage(pageIndex:Int){
        let indexPage = IndexPath(row: pageIndex, section: 0)
        self.collectionView.scrollToItem(at: indexPage, at: .centeredHorizontally, animated: true)
    }
    
    lazy var menuBar:MenuBar = {
        let menuBar = MenuBar()
        menuBar.ProfileController = self
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        return menuBar
    }()
    lazy var profileDetail:ProfileDetail = {
        let profileDetail = ProfileDetail()
        profileDetail.translatesAutoresizingMaskIntoConstraints = false
        return profileDetail
    }()
    func setNavBar(){
    
//        let button  = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        button.addTarget(self, action: #selector(touchToSearch), for: .touchUpInside)
//        let image = #imageLiteral(resourceName: "magnifier").withRenderingMode(.alwaysOriginal)
//        button.setImage(image, for: .normal)
        let spacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacing.width = 20
//        let searchButton = UIBarButtonItem(customView: button)
        
        let button1  = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button1.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        let image1 = #imageLiteral(resourceName: "gear-option").withRenderingMode(.alwaysOriginal)
        button1.setImage(image1, for: .normal)
        let moreButton = UIBarButtonItem(customView: button1)
        navigationItem.rightBarButtonItems = [moreButton,spacing]
    }
    @objc func touchToSearch(){
     
    }
    private func setUpProfileDetailView(){
        self.view.addSubview(profileDetail)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options:[] , metrics: nil, views: ["v0":profileDetail]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(116)]", options:[] , metrics: nil, views: ["v0":profileDetail]))
    }
    private func setUpMenuBar(){
         self.view.addSubview(menuBar)
        menuBar.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
       view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options:[] , metrics: nil, views: ["v0":menuBar]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0][v1(50)]", options:[] , metrics: nil, views: ["v0":profileDetail,"v1":menuBar]))
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        let height = topBarHeight + 116 + 50
    self.collectionView.contentInset = UIEdgeInsets(top: height, left: 0, bottom: 0, right: 0)
    self.collectionView.scrollIndicatorInsets = UIEdgeInsets(top: height, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      //  let height = ((self.view.frame.width - 32) * 9 / 16) + 100
     //   let size = CGSize(width: view.frame.width, height: height)
        let size = CGSize(width: view.frame.width, height: view.frame.height)
        return size
    }
}
class Test:BaseCell, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subTest", for: indexPath)
       return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.frame.width * 0.03
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.frame.width * 0.455, height: self.frame.height * 0.4)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let edgeInset = UIEdgeInsets(top: 0, left: self.frame.width * 0.03, bottom: 0, right: self.frame.width * 0.03)
        return edgeInset
    }
    let collectionViewSmall:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cv
    }()
    func setupCollectionView(){
        self.addSubview(collectionViewSmall)
        collectionViewSmall.delegate = self
        collectionViewSmall.dataSource = self
        collectionViewSmall.register(subTest.self, forCellWithReuseIdentifier: "subTest")
        collectionViewSmall.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        if let layout = collectionViewSmall.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0": collectionViewSmall]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0": collectionViewSmall]))
    }
    override func setupViews() {
        setupCollectionView()
    }
}
class subTest: BaseCell {
    
    let ImageView: UIImageView = {
        let imageView = UIImageView()
      //  imageView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        imageView.image = #imageLiteral(resourceName: "tra_dao_cam_sa_on_bg_master")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let titleLabel: UILabel = {
        let tile = UILabel()
        tile.translatesAutoresizingMaskIntoConstraints = false
        tile.font = UIFont.boldSystemFont(ofSize: 17)
        tile.text = "Trà đào cam sả"
     //   tile.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        return tile
    }()
    let subTitle: UILabel = {
        let subtitle = UILabel()
        subtitle.font = UIFont(name: subtitle.font.fontName, size: 15)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.text = "Size nhỏ"
      //  subtitle.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        return subtitle
    }()
    let priceTitle: UILabel = {
        let priceTitle = UILabel()
        priceTitle.font = UIFont.boldSystemFont(ofSize: 15)
        priceTitle.translatesAutoresizingMaskIntoConstraints = false
        priceTitle.text = "45.000 đ"
      //  priceTitle.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        return priceTitle
    }()
    let spacingView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return view
    }()
    let demoLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Custom for future"
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    override func setupViews() {
        self.backgroundColor = #colorLiteral(red: 0.9426033696, green: 0.9426033696, blue: 0.9426033696, alpha: 1)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.addSubview(demoLable)
        demoLable.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        demoLable.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        demoLable.widthAnchor.constraint(equalToConstant: 200).isActive = true
        demoLable.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
      //  addSubview(ImageView)
        //addSubview(subTitle)
        //addSubview(titleLabel)
        //addSubview(priceTitle)
      // addSubview(spacingView)
//        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-10-[v1(20)]-3-[v2(20)]-8-[v3(1)]-6-[v4(20)]-8-|", options: [], metrics: nil, views: ["v0": ImageView,"v1":titleLabel,"v2":subTitle,"v3":spacingView,"v4":priceTitle]))
//        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0": ImageView]))
//        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]|", options: [], metrics: nil, views: ["v0": titleLabel]))
//        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]|", options: [], metrics: nil, views: ["v0":subTitle ]))
//        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: [], metrics: nil, views: ["v0": spacingView]))
//         self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]|", options: [], metrics: nil, views: ["v0": priceTitle]))
    }
    
}
