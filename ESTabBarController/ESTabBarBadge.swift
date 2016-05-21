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

import Foundation
import UIKit

public enum ESTabBarBadgeType {
    case Default, Number
}

public class ESTabBarBadge: UIView {
    
    public var maximumSize: CGSize = CGSize(width: 28.0, height: 16.0)
    public var minimumSize: CGSize = CGSize(width: 6.0, height: 6.0)
    public var badgeColor: UIColor = UIColor.redColor()
    
    public var badgeValue: String? {
        didSet {
            guard let badgeValue = badgeValue else {
                self.hidden = true
                return
            }
            self.hidden = false
            badgeLabel.text = badgeValue
        }
    }
    
    private var badgeLabel: UILabel!

    private override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = badgeColor
        badgeLabel = UILabel.init()
        badgeLabel.font = UIFont.systemFontOfSize(11.0)
        badgeLabel.textColor = UIColor.whiteColor()
        badgeLabel.textAlignment = .Center
        addSubview(badgeLabel)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        self.badgeLabel.frame = self.bounds
        if layer.cornerRadius != self.bounds.size.height / 2.0 {
            layer.cornerRadius = self.bounds.size.height / 2.0
        }
    }
    
    public override func sizeToFit() {
        let size = self.sizeThatFits(CGSize.init(width: CGFloat.max, height: CGFloat.max))
        let center = self.center
        UIView.performWithoutAnimation { 
            self.frame = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
            self.center = center
        }
    }
    
    public override func sizeThatFits(size: CGSize) -> CGSize {
        var s = CGSize.zero
        guard let badgeValue = badgeValue else {
            return s
        }
        if badgeValue.characters.count > 0 {
            s = badgeLabel.sizeThatFits(CGSize.init(width: CGFloat.max, height: CGFloat.max))
            s.width = ceil(min(maximumSize.width, max(maximumSize.height, s.width + 6.0)))
            s.height = ceil(maximumSize.height)
        } else {
            s = self.minimumSize
        }
        return s
    }
    
}
