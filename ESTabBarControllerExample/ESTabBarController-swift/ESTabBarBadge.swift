//
//  ESTabBarBadge.swift
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
//  README.md
//  通过设置badgeValue参数，实现TabBarItem上的单一小红点或带数字的小红点
//  badgeValue为可选类型
//  当badgeValue为nil时，内部处理成小圆点类型
//  当badgeValue为""时，内部处理成小圆点类型
//  当badgeValue为任意非空字符串时，内部处理成带数字的小圆点类型
//  通过maximumSize设置字符串最大大小，超过截取
//  通过minimumSize设置字符串最小大小，即只有红点情况

import Foundation
import UIKit

public enum ESTabBarBadgeType {
    case Default, Number
}

public class ESTabBarBadge: UIView {
    public var maximumSize: CGSize = CGSize(width: 28.0, height: 16.0)
    public var minimumSize: CGSize = CGSize(width: 6.0, height: 6.0)
    public var badgeValue: String? {
        didSet {
            badgeLabel.text = badgeValue
            updateSubviewsLayout()
        }
    }
    private var badgeLabel: UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFontOfSize(11.0)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        return label
    }()

    private override init(frame: CGRect) {
        super.init(frame: frame)
        // 大红色
        backgroundColor = UIColor.redColor()
        // 添加Label
        addSubview(badgeLabel)
    }
    
    convenience init(frame: CGRect, type: ESTabBarBadgeType) {
        var size: CGSize!
        switch type {
        case .Default:
            size = CGSize(width: 6.0, height: 6.0)
            break
        case .Number:
            //最小也得是圆的
            size = CGSize(width: 16.0, height: 16.0)
            break
        }
        self.init(frame: CGRect.init(origin: frame.origin, size: size))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview != nil {
            self.updateSubviewsLayout()
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if layer.cornerRadius != self.bounds.size.height / 2.0 {
            layer.cornerRadius = self.bounds.size.height / 2.0
        }
    }

    
    func updateSubviewsLayout() {
        var size = frame.size
        if badgeValue?.characters.count > 0 {
            size = badgeLabel.sizeThatFits(CGSize.init(width: CGFloat.max, height: self.frame.size.height))
            size.width = ceil(min(maximumSize.width, max(maximumSize.height, size.width + 6.0)))
            size.height = ceil(maximumSize.height)
        } else {
            size = self.minimumSize
        }
        /*
        self.snp_remakeConstraints { (make) in
            if let superview = superview {
                make.top.equalTo(superview).offset(4.0)
                make.centerX.equalTo(superview).offset(12)
            }
            make.size.equalTo(size)
        }
         */
        setNeedsLayout()
    }
    
}
