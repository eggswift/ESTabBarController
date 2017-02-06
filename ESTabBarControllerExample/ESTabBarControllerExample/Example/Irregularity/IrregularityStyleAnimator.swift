//
//  BouncesStyleAnimator.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/21.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit
import pop

public class IrregularityBasicStyleAnimator: BouncesStyleAnimator {
    
    public override init() {
        super.init()
        textColor = UIColor.init(white: 255.0 / 255.0, alpha: 1.0)
        highlightTextColor = UIColor.init(red: 23/255.0, green: 149/255.0, blue: 158/255.0, alpha: 1.0)
        iconColor = UIColor.init(white: 255.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor.init(red: 23/255.0, green: 149/255.0, blue: 158/255.0, alpha: 1.0)
        backgroundColor = UIColor.init(red: 10/255.0, green: 66/255.0, blue: 91/255.0, alpha: 1.0)
        highlightBackgroundColor = UIColor.init(red: 10/255.0, green: 66/255.0, blue: 91/255.0, alpha: 1.0)
    }
}

public class IrregularityStyleAnimator: BackgroundStyleAnimator {
    
    public override var content: UIView? {
        didSet {
            if let content = content as? ESTabBarItemContent {
                content.imageView.backgroundColor = UIColor.init(red: 23/255.0, green: 149/255.0, blue: 158/255.0, alpha: 1.0)
                content.imageView.layer.borderWidth = 3.0
                content.imageView.layer.borderColor = UIColor.init(white: 235 / 255.0, alpha: 1.0).cgColor
                content.imageView.layer.cornerRadius = 35
                content.insets = UIEdgeInsetsMake(-32, 0, 0, 0)
                let transform = CGAffineTransform.identity
                content.imageView.transform = transform
                content.superview?.bringSubview(toFront: content)
            }
        }
    }
    
    public override init() {
        super.init()
        textColor = UIColor.init(white: 255.0 / 255.0, alpha: 1.0)
        highlightTextColor = UIColor.init(white: 255.0 / 255.0, alpha: 1.0)
        iconColor = UIColor.init(white: 255.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor.init(white: 255.0 / 255.0, alpha: 1.0)
        backgroundColor = .clear
        highlightBackgroundColor = .clear
    }
    
    public override func selectAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        super.selectAnimation(content: content, animated: animated, completion: completion)
        if let content = content as? ESTabBarItemContent, animated == true {
            let view = UIView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize(width: 2.0, height: 2.0)))
            view.layer.cornerRadius = 1.0
            view.layer.opacity = 0.5
            view.backgroundColor = UIColor.init(red: 10/255.0, green: 66/255.0, blue: 91/255.0, alpha: 1.0)
            content.addSubview(view)
            playMaskAnimation(animateView: view, target: content.imageView, completion: {
                [weak view] in
                view?.removeFromSuperview()
                completion?()
                })
        }
    }
    
    public override func reselectAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        super.reselectAnimation(content: content, animated: animated, completion: completion)
    }
    
    public override func deselectAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        super.deselectAnimation(content: content, animated: animated, completion: completion)
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
    
    public override func highlightAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        if let content = content as? ESTabBarItemContent {
            UIView.beginAnimations("small", context: nil)
            UIView.setAnimationDuration(0.2)
            let transform = content.imageView.transform.scaledBy(x: 0.8, y: 0.8)
            content.imageView.transform = transform
            UIView.commitAnimations()
        }
        completion?()
    }
    
    public override func dehighlightAnimation(content: UIView, animated: Bool, completion: (() -> ())?) {
        if let content = content as? ESTabBarItemContent {
            UIView.beginAnimations("big", context: nil)
            UIView.setAnimationDuration(0.2)
            let transform = CGAffineTransform.identity
            content.imageView.transform = transform
            UIView.commitAnimations()
        }
        completion?()
    }
    
    private func playMaskAnimation(animateView view: UIView, target: UIView, completion: (() -> ())?) {
        view.center = CGPoint.init(x: target.frame.origin.x + target.frame.size.width / 2.0, y: target.frame.origin.y + target.frame.size.height / 2.0)
        
        let scale = POPBasicAnimation.init(propertyNamed: kPOPLayerScaleXY)
        scale?.fromValue = NSValue.init(cgSize: CGSize.init(width: 1.0, height: 1.0))
        scale?.toValue = NSValue.init(cgSize: CGSize.init(width: 36.0, height: 36.0))
        scale?.beginTime = CACurrentMediaTime()
        scale?.duration = 0.3
        scale?.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        scale?.removedOnCompletion = true
        
        let alpha = POPBasicAnimation.init(propertyNamed: kPOPLayerOpacity)
        alpha?.fromValue = 0.6
        alpha?.toValue = 0.6
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
