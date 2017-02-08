//
//  ExampleSpreadAnimator.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/16.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit
import Foundation
import pop

public class ExampleSpreadAnimator: ExampleBaseAnimator {
    
    public override func selectAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        if let content = content as? ESTabBarItemContent, animated == true {
            let view = UIView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize(width: 2.0, height: 2.0)))
            view.layer.cornerRadius = 1.0
            view.layer.opacity = 0.5
            view.backgroundColor = UIColor.init(red: 255.0 / 255.0, green: 80.0 / 255.0, blue: 1.0 / 255.0, alpha: 1.0)
            content.addSubview(view)
            playMaskAnimation(animateView: view, target: content.imageView, completion: {
                [weak view] in
                view?.removeFromSuperview()
                completion?()
                })
            selectState(content: content, completion: nil)
        }
        else {
            selectState(content: content, completion: nil)
        }
    }
    
    public override func reselectAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        selectAnimation(content: content, animated: true, completion: completion)
    }
    
    public override func deselectAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        deselectState(content: content, completion: completion)
    }
    
    
    public  func selectState(content: UIView, completion: (() -> ())?) {
        if let content = content as? ESTabBarItemContent {
            content.backgroundColor = highlightBackgroundColor
            content.titleLabel.textColor = highlightTextColor
            if let image = content.imageView.image {
                let renderImage = image.withRenderingMode(.alwaysTemplate)
                content.imageView.image = renderImage
                content.imageView.tintColor = highlightIconColor
            }
        }
    }
    
    public func deselectState(content: UIView, completion: (() -> ())?) {
        if let content = content as? ESTabBarItemContent {
            content.backgroundColor = backgroundColor
            content.titleLabel.textColor = textColor
            if let image = content.imageView.image {
                let renderImage = image.withRenderingMode(.alwaysTemplate)
                content.imageView.image = renderImage
                content.imageView.tintColor = iconColor
            }
        }
    }
    
    private func playMaskAnimation(animateView view: UIView, target: UIView, completion: (() -> ())?) {
        view.center = CGPoint.init(x: target.frame.origin.x + target.frame.size.width / 2.0, y: target.frame.origin.y + target.frame.size.height / 2.0)
		
        let scale = POPBasicAnimation.init(propertyNamed: kPOPLayerScaleXY)
        scale?.fromValue = NSValue.init(cgSize: CGSize.init(width: 1.0, height: 1.0))
        scale?.toValue = NSValue.init(cgSize: CGSize.init(width: 46.0, height: 46.0))
        scale?.beginTime = CACurrentMediaTime()
        scale?.duration = 0.3
        scale?.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        scale?.removedOnCompletion = true
        
        let alpha = POPBasicAnimation.init(propertyNamed: kPOPLayerOpacity)
        alpha?.fromValue = 0.5
        alpha?.toValue = 0.0
        alpha?.beginTime = CACurrentMediaTime()
        alpha?.duration = 0.25
        alpha?.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        alpha?.removedOnCompletion = true
        
        view.layer.pop_add(scale, forKey: "scale")
        view.layer.pop_add(alpha, forKey: "alpha")
        
        scale?.completionBlock = ({ animation, finished in
            completion?()
        })
    }
    
}

