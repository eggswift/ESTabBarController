//
//  ESTabBarController.swift
//
//  Created by Vincent Li on 2017/2/8.
//  Copyright (c) 2013-2016 ESTabBarController (https://github.com/eggswift/ESTabBarController)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

open class ESTabBarItem: UITabBarItem {
    
    /// 自定义content view
    open var contentView: ESTabBarItemContentView?
    
    public init(_ contentView: ESTabBarItemContentView = ESTabBarItemContentView(), title: String? = nil, image: UIImage? = nil, selectedImage: UIImage? = nil, tag: Int = 0) {
        super.init()
        self.contentView = contentView
        self.setTitle(title, image: image, selectedImage: selectedImage, tag: tag)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setTitle(_ title: String? = nil, image: UIImage? = nil, selectedImage: UIImage? = nil, tag: Int = 0) {
        self.title = title
        self.image = image
        self.selectedImage = selectedImage
        self.tag = tag
    }
    
    open override var image: UIImage? {
        didSet {
            self.contentView?.image = image
        }
    }
    
    open override var selectedImage: UIImage? {
        didSet {
            self.contentView?.selectedImage = selectedImage
        }
    }
    
    open override var title: String? {
        didSet {
            self.contentView?.title = title
        }
    }
    
    open override var tag: Int {
        didSet {
            self.contentView?.tag = tag
        }
    }
 
    open override var badgeValue: String? {
        get {
            return contentView?.badgeValue
        }
        set(newValue) {
            contentView?.badgeValue = newValue
        }
    }
    
    open override var badgeColor: UIColor? {
        get {
            return contentView?.badgeColor
        }
        set(newValue) {
            contentView?.badgeColor = newValue
        }
    }
    
}
