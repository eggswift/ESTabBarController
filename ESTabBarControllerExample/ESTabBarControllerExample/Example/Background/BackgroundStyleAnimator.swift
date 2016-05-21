//
//  BackgroundStyleAnimator.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/21.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit

public class BackgroundStyleAnimator: ESTabBarItemAnimator {
    
    public override var content: UIView? {
        didSet {
            if let content = content as? ESTabBarItemContent {
                let transform = CGAffineTransformIdentity
                content.imageView.transform = CGAffineTransformScale(transform, 1.15, 1.15)
            }
        }
    }
    
    public override init() {
        super.init()
        textColor = UIColor.init(white: 165.0 / 255.0, alpha: 1.0)
        highlightTextColor = UIColor.init(white: 255.0 / 255.0, alpha: 1.0)
        iconColor = UIColor.init(white: 165.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor.init(white: 255.0 / 255.0, alpha: 1.0)
        backgroundColor = UIColor.init(red: 37/255.0, green: 39/255.0, blue: 42/255.0, alpha: 1.0)
        highlightBackgroundColor = UIColor.init(red: 22/255.0, green: 24/255.0, blue: 25/255.0, alpha: 1.0)
    }
    
    convenience init(special: Bool) {
        self.init()
        if special == true {
            textColor = UIColor.whiteColor()
            highlightTextColor = UIColor.whiteColor()
            iconColor = UIColor.whiteColor()
            highlightIconColor = UIColor.whiteColor()
            backgroundColor = UIColor.init(red: 17/255.0, green: 86/255.0, blue: 136/255.0, alpha: 1.0)
            highlightBackgroundColor = UIColor.init(red: 22/255.0, green: 24/255.0, blue: 25/255.0, alpha: 1.0)
        }
    }
    
    public override func highlightAnimation(content content: UIView, animated: Bool, completion: (() -> ())?) {
        if let content = content as? ESTabBarItemContent {
            UIView.beginAnimations("small", context: nil)
            UIView.setAnimationDuration(0.2)
            let transform = CGAffineTransformScale(content.imageView.transform, 0.8, 0.8)
            content.imageView.transform = transform
            UIView.commitAnimations()
        }
        completion?()
    }
    
    public override func dehighlightAnimation(content content: UIView, animated: Bool, completion: (() -> ())?) {
        if let content = content as? ESTabBarItemContent {
            UIView.beginAnimations("big", context: nil)
            UIView.setAnimationDuration(0.2)
            let transform = CGAffineTransformIdentity
            content.imageView.transform = CGAffineTransformScale(transform, 1.15, 1.15)
            UIView.commitAnimations()
        }
        completion?()
    }

}