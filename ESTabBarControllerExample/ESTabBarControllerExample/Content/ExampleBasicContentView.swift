//
//  ExampleBasicContentView.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 2017/2/9.
//  Copyright © 2017年 Vincent Li. All rights reserved.
//

import UIKit

class ExampleBasicContentView: ESTabBarItemContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightTextColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
        iconColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override var image: UIImage? {
        didSet {
            if !selected {
                self.imageView.image = image?.withRenderingMode(.alwaysTemplate)
                self.imageView.tintColor = iconColor
                self.updateLayout()
            }
        }
    }
    
    override var selectedImage: UIImage? {
        didSet {
            if selected {
                self.imageView.image = selectedImage?.withRenderingMode(.alwaysTemplate) ?? image?.withRenderingMode(.alwaysTemplate)
                self.imageView.tintColor = highlightIconColor
                self.updateLayout()
            }
        }
    }
    
    override func updateDisplay() {
        if selected {
            backgroundColor = highlightBackdropColor
            imageView.image = selectedImage?.withRenderingMode(.alwaysTemplate) ?? image?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = highlightIconColor
            titleLabel.textColor = highlightTextColor
        } else {
            backgroundColor = backdropColor
            imageView.image = image?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = iconColor
            titleLabel.textColor = textColor
        }
    }


}
