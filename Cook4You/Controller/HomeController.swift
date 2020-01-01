//
//  HomeControllerViewController.swift
//  Cook4You
//
//  Created by HoThienHo on 11/21/19.
//  Copyright © 2019 nhom24. All rights reserved.
//

import UIKit
import SnapKit
struct Meal{
    var image: String?
    var title: String?
    var subtitle: String?
    var imageProfile: String?
    var name: String?
    var author: String?
}
class TryCell: BaseCell {
    static let ID = "TryCell"
    let viewImage: UIView = {
        let viewImage = UIView()
        viewImage.translatesAutoresizingMaskIntoConstraints = false
        return viewImage
    }()
    let mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "dish")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let inforView: UIView = {
        let infor = UIView()
        infor.translatesAutoresizingMaskIntoConstraints = false
        return infor
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "title"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let subTitle: UILabel = {
        let subTitle = UILabel()
        subTitle.text = "subTitle"
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }()
    
    let profileImage: UIImageView = {
        let pro = UIImageView()
        pro.contentMode = .scaleAspectFill
        pro.clipsToBounds = true
        pro.layer.cornerRadius = 5
        pro.image = #imageLiteral(resourceName: "dish")
        pro.backgroundColor = .green
        pro.translatesAutoresizingMaskIntoConstraints = false
        return pro
    }()
    
    let nameTitle : UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Name"
        return name
    }()
    
    let authorTitle: UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.text = "Author title"
        return author
    }()
    
    override func setupViews() {
        
        clipsToBounds = true
        layer.cornerRadius = 5
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.2
        addSubview(viewImage)
        addSubview(inforView)
        inforView.addSubview(titleLabel)
        inforView.addSubview(subTitle)
        inforView.addSubview(profileImage)
        viewImage.addSubview(mealImageView)
        inforView.addSubview(nameTitle)
        inforView.addSubview(authorTitle)
        viewImage.snp.makeConstraints { (maker) in
            maker.leading.top.trailing.equalToSuperview()
            maker.height.equalToSuperview().multipliedBy(0.7)
        }
        mealImageView.snp.makeConstraints { (maker) in
            maker.leading.trailing.top.bottom.equalToSuperview()
            maker.height.width.equalToSuperview()
        }
        inforView.snp.makeConstraints { (maker) in
            maker.leading.bottom.trailing.equalToSuperview()
            maker.top.equalTo(viewImage.snp.bottom)
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().inset(8)
            maker.top.equalToSuperview().inset(10)
        }
        subTitle.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().inset(8)
            maker.top.equalTo(titleLabel.snp.bottom).offset(2)
        }
        profileImage.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().inset(8)
            maker.bottom.equalToSuperview().inset(8)
            maker.width.height.equalTo(50)
        }
        
        authorTitle.snp.makeConstraints { (maker) in
            maker.leading.equalTo(profileImage.snp.trailing).offset(12)
                maker.bottom.equalToSuperview().inset(8)
        }
        nameTitle.snp.makeConstraints { (maker) in
            maker.leading.equalTo(profileImage.snp.trailing).offset(12)
            maker.top.equalTo(profileImage.snp.top.self)
        }
    }
    
    func configCell(_ data: Meal){
        if let data = data.image{
            mealImageView.image = UIImage(named: data)
        }
        titleLabel.text = data.title
        subTitle.text = data.subtitle
        if let data = data.imageProfile{
            profileImage.image = UIImage(named: data)
        }
        nameTitle.text = data.name
        authorTitle.text = data.author
    }
}

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    let datasource = [
        Meal(image: "dish", title: "Today", subtitle: "Today", imageProfile: "", name: "Today", author: "Today"),
        Meal(image: "dish", title: "Today", subtitle: "Today", imageProfile: "", name: "Today", author: "Today"),
        Meal(image: "dish", title: "Today", subtitle: "Today", imageProfile: "", name: "Today", author: "Today")
    ]
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
        return view
    }()
    
    lazy var scrollView : UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.autoresizingMask = .flexibleHeight
        view.showsHorizontalScrollIndicator = true
        return view
    }()

    
    lazy var label : UILabel = {
        let label = UILabel()
        label.text = "Today's Story"
        return label
    }()
    
    let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TryCell.self, forCellWithReuseIdentifier: TryCell.ID)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let longTitleLabel = UILabel()
        longTitleLabel.text = "Cook4You"
        longTitleLabel.font = UIFont.systemFont(ofSize: 22)
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        indexTabBar = 0
        setupView()
        
    
    }
    
    func setupView(){
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(label)
        containerView.addSubview(collection)
//        label.snp.makeConstraints { (maker) in
//            maker.leading.equalToSuperview().inset(12)
//            maker.top.equalToSuperview().inset(20)
//        }
        collection.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().inset(12)
            maker.top.equalToSuperview().inset(12)
            maker.trailing.equalToSuperview().inset(12)
            maker.height.equalToSuperview().multipliedBy(0.3)
        }
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TryCell.ID, for: indexPath) as! TryCell
        cell.configCell(datasource[indexPath.row])
        return cell
    }
    
    
    
     

}
