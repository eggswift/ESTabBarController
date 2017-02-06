//
//  ExampleViewController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/16.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import Foundation
import UIKit

public class ExampleViewController: UIViewController {
    let tip: UIButton = UIButton.init()
    let icon: UIButton = UIButton.init()
    let button: UIButton = UIButton.init()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(white: 245.0 / 255.0, alpha: 1.0)
        
        tip.setTitle("Click me!", for: .normal)
        tip.setTitleColor(UIColor.init(white: 154.0 / 255.0, alpha: 1.0), for: .normal)
        tip.isUserInteractionEnabled = false
        
        icon.layer.cornerRadius = 12.0
        icon.setImage(UIImage.init(named: "icon"), for: .normal)
        icon.addTarget(self, action: #selector(ExampleViewController.homePageAction), for: .touchUpInside)
        
        button.setTitle("  Click to pop or dismiss  ", for: .normal)
        button.backgroundColor = UIColor.init(white: 245.0 / 255.0, alpha: 1.0)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.init(white: 154.0 / 255.0, alpha: 1.0).cgColor
        button.layer.cornerRadius = 15.0
        button.setTitleColor(UIColor.init(white: 100.0 / 255.0, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(ExampleViewController.backAction), for: .touchUpInside)
        
        view.addSubview(icon)
        view.addSubview(button)
        view.addSubview(tip)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        icon.sizeToFit()
        icon.center = CGPoint.init(x: self.view.bounds.size.width / 2.0 + 12, y: self.view.bounds.size.height / 2.0 - 46.0)
        tip.frame = CGRect.init(x: icon.frame.origin.x + 32, y: self.icon.frame.origin.y + 68, width: 120, height: 42)
        let size = button.sizeThatFits(self.view.bounds.size)
        button.frame = CGRect.init(x: (self.view.bounds.size.width - size.width) / 2.0, y: icon.frame.origin.y + icon.frame.size.height + 6.0, width: size.width, height: 30.0)
    }
    
    public func homePageAction() {
        let vc = WebViewController.instanceFromStoryBoard()
        vc.hidesBottomBarWhenPushed = true
        if let navigationController = navigationController {
            navigationController.pushViewController(vc, animated: true)
            return
        }
        present(vc, animated: true, completion: nil)
    }
    
    public func backAction() {
        if let navigationController = navigationController {
            if navigationController.viewControllers.count > 1 {
                navigationController.popViewController(animated: true)
                return
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
}
