//
//  CreateRecipe2.swift
//  Cook4You
//
//  Created by HoThienHo on 12/10/19.
//  Copyright © 2019 nhom24. All rights reserved.
//

import UIKit

class CreateRecipe2: BaseCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var createRecipeController: CreateRecipe?
    let labelOne: UILabel = {
        let label = UILabel()
        label.text = "Scroll Top"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTwo: UILabel = {
        let label = UILabel()
        label.text = "Scroll Bottom"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "We're excited to see your recipe! Let's start with the basics..."
        label.numberOfLines = 0
        label.textAlignment = .left
        label.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9607843137, blue: 0.9411764706, alpha: 1)
        return label
    }()
    let uploadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Upload a final photo of your dish now"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        label.textAlignment = .left
        label.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9607843137, blue: 0.9411764706, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    let viewForContent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    let introduceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9607843137, blue: 0.9411764706, alpha: 1)
        return view
    }()
    let recipeNameTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NAME YOUR RECIPE*"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    let addRecipeTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ADD A RECIPE PHOTO"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    let recipeNameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        let attributes = [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 19)
        ]
        tf.attributedPlaceholder = NSAttributedString(string: "E.g. Grandma's apple pie", attributes:attributes)
        tf.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tf
    }()
    let separateLine1: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return v
    }()
    @objc func handleSelectProfileImageView(){
        print(123)
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        createRecipeController!.present(picker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel Picker")
        createRecipeController!.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImageFromPicker: UIImage?
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            selectedImageFromPicker = editedImage
        }
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            recipeImageView.image = selectedImage
            uploadLabel.isHidden = true
            recipeImageView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        createRecipeController!.dismiss(animated: true, completion: nil)
    }
    lazy var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
        imageView.contentMode = .scaleAspectFill
        //imageView.image = #imageLiteral(resourceName: "124010")
        imageView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9607843137, blue: 0.9411764706, alpha: 1)
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        imageView.addSubview(uploadLabel)
        uploadLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        uploadLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        return imageView
    }()
    lazy var scrollView: UIScrollView = {
        let scrollView: UIScrollView!
        let screensize: CGRect = self.frame
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return scrollView
    }()
    override func setupViews() {
        let screensize: CGRect = self.frame
          let screenWidth = screensize.width
        backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        //recipeNameTextField.inputAccessoryView = createRecipeController?.navigationController?.toolbar
       // scrollView.addSubview(labelTwo)

//        NSLayoutConstraint(item: labelTwo, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: labelTwo, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
//        NSLayoutConstraint(item: labelTwo, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: labelTwo, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
//
//
//
//        scrollView.addSubview(labelOne)
//
//        NSLayoutConstraint(item: labelOne, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
//        NSLayoutConstraint(item: labelOne, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
//        NSLayoutConstraint(item: labelOne, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1, constant: screenHeight - 30).isActive = true
//        NSLayoutConstraint(item: labelOne, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
        
        scrollView.contentSize = CGSize(width: screenWidth, height: 658)
        
        scrollView.addSubview(introduceView)
        introduceView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        introduceView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        introduceView.widthAnchor.constraint(equalToConstant: scrollView.frame.width).isActive = true
        introduceView.heightAnchor.constraint(equalToConstant: 74).isActive = true
        
        introduceView.addSubview(testLabel)
        testLabel.bottomAnchor.constraint(equalTo: introduceView.bottomAnchor, constant: 0).isActive = true
        testLabel.heightAnchor.constraint(equalTo: introduceView.heightAnchor).isActive = true
        testLabel.widthAnchor.constraint(equalTo: introduceView.widthAnchor).isActive = true
        testLabel.leftAnchor.constraint(equalTo: introduceView.leftAnchor, constant: 8).isActive = true
        
        scrollView.addSubview(viewForContent)
        viewForContent.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        viewForContent.topAnchor.constraint(equalTo: introduceView.bottomAnchor, constant: 0).isActive = true
        viewForContent.widthAnchor.constraint(equalToConstant: scrollView.frame.width).isActive = true
        viewForContent.heightAnchor.constraint(equalToConstant: 584).isActive = true
        
        viewForContent.addSubview(recipeNameTitle)
        recipeNameTitle.leftAnchor.constraint(equalTo: viewForContent.leftAnchor, constant: 8).isActive = true
        recipeNameTitle.topAnchor.constraint(equalTo: viewForContent.topAnchor, constant: 36).isActive = true
        recipeNameTitle.widthAnchor.constraint(equalTo: viewForContent.widthAnchor, constant: -8).isActive = true
        recipeNameTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
       viewForContent.addSubview(recipeNameTextField)
        recipeNameTextField.leftAnchor.constraint(equalTo: viewForContent.leftAnchor, constant: 8).isActive = true
         recipeNameTextField.topAnchor.constraint(equalTo: recipeNameTitle.bottomAnchor, constant: 8).isActive = true
       recipeNameTextField.rightAnchor.constraint(equalTo: viewForContent.rightAnchor, constant: -8).isActive = true
        recipeNameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
       viewForContent.addSubview(separateLine1)
        separateLine1.topAnchor.constraint(equalTo: recipeNameTextField.bottomAnchor, constant: 0).isActive = true
      separateLine1.leftAnchor.constraint(equalTo: viewForContent.leftAnchor, constant: 8).isActive = true
       separateLine1.rightAnchor.constraint(equalTo: viewForContent.rightAnchor, constant: -8).isActive = true
        separateLine1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        viewForContent.addSubview(addRecipeTitle)
        addRecipeTitle.leftAnchor.constraint(equalTo: viewForContent.leftAnchor, constant: 8).isActive = true
        addRecipeTitle.topAnchor.constraint(equalTo: separateLine1.bottomAnchor, constant: 32).isActive = true
        addRecipeTitle.widthAnchor.constraint(equalTo: viewForContent.widthAnchor, constant: -8).isActive = true
        addRecipeTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        viewForContent.addSubview(recipeImageView)
        recipeImageView.leftAnchor.constraint(equalTo: viewForContent.leftAnchor, constant: 8).isActive = true
        recipeImageView.topAnchor.constraint(equalTo:  addRecipeTitle.bottomAnchor, constant: 12).isActive = true
        recipeImageView.rightAnchor.constraint(equalTo: viewForContent.rightAnchor, constant: -8).isActive = true
        recipeImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        addSubview(scrollView)
        
    }
}
