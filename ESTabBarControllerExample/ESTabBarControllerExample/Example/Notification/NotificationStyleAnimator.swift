//
//  NotificationStyleAnimator.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/21.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit

public class NotificationStyleAnimator: BackgroundStyleAnimator {

    public var duration = 0.3

    public override func badgeChangedAnimation(content: UIView, completion: (() -> ())?) {
        super.badgeChangedAnimation(content: content, completion: completion)
        if let content = content as? ESTabBarItemContent {
            notificationAnimation(view: content.imageView)
        }
    }
    
    internal func notificationAnimation(view: UIView) {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        impliesAnimation.values = [0.0 ,-8.0, 4.0, -4.0, 3.0, -2.0, 0.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = kCAAnimationCubic
        
        view.layer.add(impliesAnimation, forKey: nil)
    }
    
}
