//
//  BackgroundStyleTabBarController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/21.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import Foundation
import UIKit

public class NotificationStyleTabBarController: ESTabBarController {
    var value: Int64 = 0
    let button: UIButton = {
        let button = UIButton.init()
        button.backgroundColor = .lightGray
        button.setTitle("Click", for: .normal)
        button.layer.cornerRadius = 25.0
        button.clipsToBounds = true
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notification"
        button.addTarget(self, action: #selector(NotificationStyleTabBarController.buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
        let v1          = ExampleViewController()
        let v2          = ExampleViewController()
        let v3          = ExampleViewController()
        let v4          = ExampleViewController()
        let v5          = ExampleViewController()
        
        let c1 = ESTabBarItemContent.init(animator: NotificationStyleAnimator.init())
        let c2 = ESTabBarItemContent.init(animator: NotificationStyleAnimator.init())
        let c3 = ESTabBarItemContent.init(animator: NotificationStyleAnimator.init())
        let c4 = ESTabBarItemContent.init(animator: NotificationStyleAnimator.init())
        let c5 = ESTabBarItemContent.init(animator: NotificationStyleAnimator.init())
        
        c1.highlightEnabled = true
        c2.highlightEnabled = true
        c3.highlightEnabled = true
        c4.highlightEnabled = true
        c5.highlightEnabled = true
        
        v1.tabBarItem   = ESTabBarItem.init(content: c1)
        v2.tabBarItem   = ESTabBarItem.init(content: c2)
        v3.tabBarItem   = ESTabBarItem.init(content: c3)
        v4.tabBarItem   = ESTabBarItem.init(content: c4)
        v5.tabBarItem   = ESTabBarItem.init(content: c5)
        
        v1.tabBarItem.image = UIImage.init(named: "home")
        v2.tabBarItem.image = UIImage.init(named: "find")
        v3.tabBarItem.image = UIImage.init(named: "cardboard")
        v4.tabBarItem.image = UIImage.init(named: "message")
        v5.tabBarItem.image = UIImage.init(named: "me")
        v1.tabBarItem.selectedImage = UIImage.init(named: "home_1")
        v2.tabBarItem.selectedImage = UIImage.init(named: "find_1")
        v3.tabBarItem.selectedImage = UIImage.init(named: "cardboard_1")
        v4.tabBarItem.selectedImage = UIImage.init(named: "message_1")
        v5.tabBarItem.selectedImage = UIImage.init(named: "me_1")
        
        let controllers = [v1, v2, v3, v4, v5]
        self.viewControllers = controllers
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect.init(x: self.view.bounds.size.width - 120, y: self.view.bounds.size.height / 2, width: 100, height: 50)
    }
    
    func buttonAction() {
        value += 1
        if let item = self.tabBar.items![3] as? ESTabBarItem {
            item.badgeValue = String(value)
        }
    }

}
