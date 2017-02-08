//
//  ESTabBarItemAnimator.swift
//
//  Created by egg swift on 16/4/7.
//  Copyright (c) 2013-2016 ESPullToRefresh (https://github.com/eggswift/ESTabBarController)
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
import Foundation

public class ESTabBarItemAnimator: NSObject, ESTabBarItemAnimatorProtocol {
    
    public weak var content: UIView?
    
    public var textColor = UIColor.init(white: 146.0 / 255.0, alpha: 1.0)
    public var highlightTextColor = UIColor.init(red: 0.0 / 255.0, green: 116.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    public var iconColor = UIColor.init(white: 146.0 / 255.0, alpha: 1.0)
    public var highlightIconColor = UIColor.init(red: 0.0 / 255.0, green: 116.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    public var backgroundColor = UIColor.clear
    public var highlightBackgroundColor = UIColor.clear
	
    public func selectAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        if let content = content as? ESTabBarItemContent {
            content.backgroundColor = highlightBackgroundColor
            content.titleLabel.textColor = highlightTextColor
            if let image = content.imageView.image {
                let renderImage = image.withRenderingMode(.alwaysTemplate)
                content.imageView.image = renderImage
                content.imageView.tintColor = highlightIconColor
            }
        }
        completion?()
    }
    
    public func reselectAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        if let content = content as? ESTabBarItemContent {
            content.backgroundColor = highlightBackgroundColor
            content.titleLabel.textColor = highlightTextColor
            if let image = content.imageView.image {
                let renderImage = image.withRenderingMode(.alwaysTemplate)
                content.imageView.image = renderImage
                content.imageView.tintColor = highlightIconColor
            }
        }
        completion?()
    }
    
    public func deselectAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        if let content = content as? ESTabBarItemContent {
            content.backgroundColor = backgroundColor
            content.titleLabel.textColor = textColor
            if let image = content.imageView.image {
                let renderImage = image.withRenderingMode(.alwaysTemplate)
                content.imageView.image = renderImage
                content.imageView.tintColor = iconColor
            }
        }
        completion?()
    }

    public func highlightAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
    public func dehighlightAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
    public func badgeChangedAnimation(content: UIView, completion: (() -> ())?) {
        completion?()
    }
}
