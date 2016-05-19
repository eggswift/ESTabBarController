//
//  ExampleImpliesTabBarItemContent.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/17.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit

public class ExampleImpliesTabBarItemContent: ESTabBarItemContent {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: #selector(ExampleImpliesTabBarItemContent.playImpliesAnimation(_:)), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func playImpliesAnimation(sender: AnyObject?) {
        if self.selected == true {
            return
        }
        let view = self.imageView
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0 ,1.12, 0.88, 1.0]
        impliesAnimation.duration = 1.6
        impliesAnimation.calculationMode = kCAAnimationCubic
        
        view.layer.addAnimation(impliesAnimation, forKey: nil)
    }
    
    
}
