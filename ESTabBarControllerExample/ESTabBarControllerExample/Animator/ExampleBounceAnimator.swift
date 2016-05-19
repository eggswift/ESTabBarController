//
//  ExampleBounceAnimator.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/16.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit

public class ExampleBounceAnimator: ExampleBaseAnimator {

    public override func selectAnimation(content content: UIView, animated: Bool, completion: (() -> ())?) {
        super.selectAnimation(content: content, animated: animated, completion: completion)
        if let content = content as? ESTabBarItemContent {
            self.bounceAnimation(content.imageView)
        }
    }
    
    public override func reselectAnimation(content content: UIView, animated: Bool, completion: (() -> ())?) {
        super.reselectAnimation(content: content, animated: animated, completion: completion)
        if let content = content as? ESTabBarItemContent {
            self.bounceAnimation(content.imageView)
        }
    }
    
    public override func deselectAnimation(content content: UIView, animated: Bool, completion: (() -> ())?) {
        super.deselectAnimation(content: content, animated: animated, completion: completion)
    }

    internal func bounceAnimation(view: UIView) {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = kCAAnimationCubic
        
        view.layer.addAnimation(impliesAnimation, forKey: nil)
    }
    
}
