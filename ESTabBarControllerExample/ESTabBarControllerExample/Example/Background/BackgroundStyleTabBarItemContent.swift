//
//  BackgroundStyleTabBarItemContent.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/21.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit

public class BackgroundStyleTabBarItemContent: ESTabBarItemContent {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(BackgroundStyleTabBarItemContent.playImpliesAnimation(_:)), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func playImpliesAnimation(sender: AnyObject?) {
        if self.selected == true || self.highlighted == true {
            return
        }
        let view = self.imageView
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.15, 0.8, 1.15]
        impliesAnimation.duration = 0.3
        impliesAnimation.calculationMode = kCAAnimationCubic
        impliesAnimation.removedOnCompletion = true
        view.layer.addAnimation(impliesAnimation, forKey: nil)
    }

}
