//
//  UIMaker.swift
//  Cook4You
//
//  Created by Le Tong Minh Hieu on 12/8/19.
//  Copyright © 2019 nhom24. All rights reserved.
//

import Foundation
import UIKit
struct UIMaker{
    static func makeContentLabel(fontSize: CGFloat, text: String? = nil, isBold: Bool = false, color: UIColor = UIColor.white, numberOfLines: Int = 0, alighment: NSTextAlignment = .left) -> UILabel{
        let label = UILabel()
        label.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont(name: label.font.fontName, size: 12)
        label.text = text
        label.textColor = color
        label.textAlignment = alighment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = .byWordWrapping
        return label
    }
}
