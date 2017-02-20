//
//  ESTabBarContentView.swift
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

open class ESTabBarItemContentView: UIView {
    
    /// 设置contentView的偏移
    open var insets: UIEdgeInsets = UIEdgeInsets.zero
    /// 当前是否被选中
    open var selected: Bool = false
    /// 当前是否高亮
    open var highlighted: Bool = false
    /// 是否支持高亮
    open var highlightEnabled: Bool = true

    open var textColor = UIColor(white: 146.0 / 255.0, alpha: 1.0) {
        didSet {
            if !selected {
                titleLabel.textColor = textColor
            }
        }
    }
    open var highlightTextColor = UIColor(red: 0.0 / 255.0, green: 122.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0) {
        didSet {
            if selected {
                titleLabel.textColor = highlightIconColor
            }
        }
    }
    open var iconColor = UIColor(white: 146.0 / 255.0, alpha: 1.0) {
        didSet {
            if !selected {
                imageView.tintColor = iconColor
            }
        }
    }
    open var highlightIconColor = UIColor(red: 0.0 / 255.0, green: 122.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0) {
        didSet {
            if selected {
                imageView.tintColor = highlightIconColor
            }
        }
    }
    open var backdropColor = UIColor.clear {
        didSet {
            if !selected {
                backgroundColor = backdropColor
            }
        }
    }
    open var highlightBackdropColor = UIColor.clear {
        didSet {
            if selected {
                backgroundColor = highlightBackdropColor
            }
        }
    }
    
    open var image: UIImage? {
        didSet {
            if !selected {
                set(imageViewImage: image)
                self.imageView.tintColor = iconColor
                self.updateLayout()
            }
        }
    }
    
    open var selectedImage: UIImage? {
        didSet {
            if selected {
                set(imageViewImage: selectedImage ?? image)
                self.imageView.tintColor = highlightIconColor
                self.updateLayout()
            }
        }
    }
    
    open var title: String? {
        didSet {
            self.titleLabel.text = title
            self.updateLayout()
        }
    }
    
    open var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    open var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect.zero)
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .clear
        titleLabel.font = UIFont.systemFont(ofSize: 10.0)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    
    /// 小红点相关属性
    open var badgeValue: String? {
        didSet {
            if let _ = badgeValue {
                self.badgeView.badgeValue = badgeValue
                self.addSubview(badgeView)
                self.updateLayout()
            } else {
                // Remove when nil.
                self.badgeView.removeFromSuperview()
            }
            badgeChanged(animated: true, completion: nil)
        }
    }
    open var badgeColor: UIColor? {
        didSet {
            if let _ = badgeColor {
                self.badgeView.badgeColor = badgeColor
            } else {
                self.badgeView.badgeColor = ESTabBarItemBadgeView.defaultBadgeColor
            }
        }
    }
    open var badgeView: ESTabBarItemBadgeView = ESTabBarItemBadgeView() {
        willSet {
            if let _ = badgeView.superview {
                badgeView.removeFromSuperview()
            }
        }
        didSet {
            if let _ = badgeView.superview {
                self.updateLayout()
            }
        }
    }
    open var badgeOffset: UIOffset = UIOffset.init(horizontal: 6.0, vertical: -22.0) {
        didSet {
            if badgeOffset != oldValue {
                self.updateLayout()
            }
        }
    }
    

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = false
        
        addSubview(imageView)
        addSubview(titleLabel)
        
        titleLabel.textColor = textColor
        imageView.tintColor = iconColor
        backgroundColor = backdropColor
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func updateDisplay() {
        if selected {
            backgroundColor = highlightBackdropColor
            set(imageViewImage: selectedImage ?? image)
            imageView.tintColor = highlightIconColor
            titleLabel.textColor = highlightTextColor
        } else {
            backgroundColor = backdropColor
            set(imageViewImage: image)
            imageView.tintColor = iconColor
            titleLabel.textColor = textColor
        }
    }
    
    open func updateLayout() {
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        imageView.isHidden = (imageView.image == nil)
        titleLabel.isHidden = (titleLabel.text == nil)
        
        if !imageView.isHidden && !titleLabel.isHidden {
            titleLabel.sizeToFit()
            imageView.sizeToFit()
            titleLabel.frame = CGRect.init(x: (w - titleLabel.bounds.size.width) / 2.0,
                                           y: h - titleLabel.bounds.size.height - 1.0,
                                           width: titleLabel.bounds.size.width,
                                           height: titleLabel.bounds.size.height)
            imageView.frame = CGRect.init(x: (w - imageView.bounds.size.width) / 2.0,
                                          y: (h - imageView.bounds.size.height) / 2.0 - 6.0,
                                          width: imageView.bounds.size.width,
                                          height: imageView.bounds.size.height)
        } else if !imageView.isHidden {
            imageView.sizeToFit()
            imageView.center = CGPoint.init(x: w / 2.0, y: h / 2.0)
        } else if !titleLabel.isHidden {
            titleLabel.sizeToFit()
            titleLabel.center = CGPoint.init(x: w / 2.0, y: h / 2.0)
        }
        
        if let _ = badgeView.superview {
            let size = badgeView.sizeThatFits(self.frame.size)
            badgeView.frame = CGRect.init(origin: CGPoint.init(x: w / 2.0 + badgeOffset.horizontal, y: h / 2.0 + badgeOffset.vertical), size: size)
        }
    }
    
    internal final func set(imageViewImage image: UIImage?) -> Void {
        if let image = image {
            switch image.renderingMode {
            case .automatic:
                self.imageView.image = image.withRenderingMode(.alwaysTemplate)
            case .alwaysOriginal, .alwaysTemplate:
                self.imageView.image = image
            }
        }
    }

    internal final func select(animated: Bool, completion: (() -> ())?) {
        selected = true
        if highlightEnabled && highlighted {
            highlighted = false
            dehighlightAnimation(animated: animated, completion: { [weak self] in
                self?.updateDisplay()
                self?.selectAnimation(animated: animated, completion: completion)
            })
        } else {
            updateDisplay()
            selectAnimation(animated: animated, completion: completion)
        }
    }
    
    internal final func deselect(animated: Bool, completion: (() -> ())?) {
        selected = false
        updateDisplay()
        self.deselectAnimation(animated: animated, completion: completion)
    }
    
    internal final func reselect(animated: Bool, completion: (() -> ())?) {
        if selected == false {
            select(animated: animated, completion: completion)
        } else {
            if highlightEnabled && highlighted {
                highlighted = false
                dehighlightAnimation(animated: animated, completion: { [weak self] in
                    self?.reselectAnimation(animated: animated, completion: completion)
                })
            } else {
                reselectAnimation(animated: animated, completion: completion)
            }
        }
    }
    
    internal final func highlight(animated: Bool, completion: (() -> ())?) {
        if !highlightEnabled {
            return
        }
        if highlighted == true {
            return
        }
        highlighted = true
        self.highlightAnimation(animated: animated, completion: completion)
    }
    
    internal final func dehighlight(animated: Bool, completion: (() -> ())?) {
        if !highlightEnabled {
            return
        }
        if !highlighted {
            return
        }
        highlighted = false
        self.dehighlightAnimation(animated: animated, completion: completion)
    }
    
    internal func badgeChanged(animated: Bool, completion: (() -> ())?) {
        self.badgeChangedAnimation(animated: animated, completion: completion)
    }
    
    open func selectAnimation(animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
    open func deselectAnimation(animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
    open func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
    open func highlightAnimation(animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
    open func dehighlightAnimation(animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
    open func badgeChangedAnimation(animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
}
