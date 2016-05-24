//
//  ESTabBarItemContent.swift
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

import Foundation
import UIKit

public class ESTabBarItemContent: UIView {
    
    public weak var item: UITabBarItem!
    public var animator: ESTabBarItemAnimatorProtocol!
    public var insets: UIEdgeInsets = UIEdgeInsetsZero
    public var highlighted: Bool = false
    public var highlightEnabled: Bool = true
    
    // Badge
    public var badgeView: ESTabBarBadge!
    public var badgeOffset: UIOffset = UIOffset.init(horizontal: 12.0, vertical: -21.0)
    public var badgeValue: String? {
        didSet {
            badgeView.badgeValue = badgeValue
            setNeedsLayout()
            animator.badgeChangedAnimation(content: self, completion: nil)
        }
    }
    
    public var selected: Bool = false {
        didSet {
            if selected == true && selectedImage != nil {
                imageView.image = selectedImage
            } else {
                imageView.image = image
            }
        }
    }
    public var image: UIImage? {
        didSet {
            if selected == false || selectedImage == nil {
                imageView.image = image
                animator.deselectAnimation(content: self, animated: false, completion: nil)
                setNeedsLayout()
            }
        }
    }
    public var selectedImage: UIImage? {
        didSet {
            if selected == true {
                imageView.image = selectedImage
                animator.selectAnimation(content: self, animated: false, completion: nil)
                setNeedsLayout()
            }
        }
    }
    public var title: String? {
        didSet {
            titleLabel.text = title
            setNeedsLayout()
        }
    }
    
    public var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.backgroundColor = UIColor.clearColor()
        return imageView
    }()
    
    public var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect.zero)
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.clearColor()
        titleLabel.font = UIFont.systemFontOfSize(9.0)
        titleLabel.textAlignment = NSTextAlignment.Center
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userInteractionEnabled = false
        animator = ESTabBarItemAnimator.init()
        if let anim = animator as? ESTabBarItemAnimator {
            anim.content = self
        }
        badgeView = ESTabBarBadge()
        badgeView?.hidden = true
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(badgeView)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(animator anim: ESTabBarItemAnimatorProtocol) {
        self.init()
        userInteractionEnabled = false
        animator = anim
        if let anim = anim as? ESTabBarItemAnimator {
            anim.content = self
        }
        badgeView = ESTabBarBadge()
        badgeView?.hidden = true
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(badgeView)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        imageView.hidden = (imageView.image != nil) ? false : true
        titleLabel.hidden = (titleLabel.text != nil) ? false : true
        if imageView.image != nil && titleLabel.text != nil {
            titleLabel.sizeToFit()
            imageView.sizeToFit()
            titleLabel.frame = CGRect.init(x: (w - titleLabel.bounds.size.width) / 2.0, y: h - titleLabel.bounds.size.height - 1.0, width: titleLabel.bounds.size.width, height: titleLabel.bounds.size.height)
            imageView.frame = CGRect.init(x: (w - imageView.bounds.size.width) / 2.0, y: (h - imageView.bounds.size.height) / 2.0 - 5.0, width: imageView.bounds.size.width, height: imageView.bounds.size.height)
        } else if imageView.image != nil {
            imageView.sizeToFit()
            imageView.center = CGPoint.init(x: w / 2.0, y: h / 2.0)
        } else if titleLabel.text != nil {
            titleLabel.sizeToFit()
            titleLabel.center = CGPoint.init(x: w / 2.0, y: h / 2.0)
        }
        
        if let badgeView = badgeView {
            let size = badgeView.sizeThatFits(self.frame.size)
            badgeView.frame = CGRect.init(origin: CGPoint.init(x: w / 2.0 + badgeOffset.horizontal, y: h / 2.0 + badgeOffset.vertical), size: size)
        }
        
    }
    
    public func select(animated animated: Bool, completion: (() -> ())?){
        selected = true
        if highlightEnabled == true && highlighted == true {
            highlighted = false
            animator.dehighlightAnimation(content: self, animated: animated, completion: {
                self.animator.selectAnimation(content: self, animated: animated, completion: completion)
            })
        } else {
            animator.selectAnimation(content: self, animated: animated, completion: completion)
        }
    }
    
    public func reselect(animated animated: Bool, completion: (() -> ())?){
        selected = true
        animator.reselectAnimation(content: self, animated: animated, completion: completion)
    }
    
    public func deselect(animated animated: Bool, completion: (() -> ())?){
        selected = false
        animator.deselectAnimation(content: self, animated: animated, completion: completion)
    }
    
    public func highlight(highlight highlight: Bool, animated: Bool, completion: (() -> ())?){
        if highlightEnabled == true && highlighted != highlight {
            highlighted = highlight
            if highlighted == true {
                animator.highlightAnimation(content: self, animated: animated, completion: completion)
            } else {
                animator.dehighlightAnimation(content: self, animated: animated, completion: {
                    if self.selected == true {
                        self.animator.selectAnimation(content: self, animated: false, completion: completion)
                    } else {
                        self.animator.deselectAnimation(content: self, animated: false, completion: completion)
                    }
                })
            }
        }
    }
    
}

