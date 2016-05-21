//
//  BouncesStyleTabBarController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/21.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit

public class BouncesStyleTabBarController: ESTabBarController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bounces"
        
        let v1          = ExampleViewController()
        let v2          = ExampleViewController()
        let v3          = ExampleViewController()
        let v4          = ExampleViewController()
        let v5          = ExampleViewController()
        
        v1.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: BouncesStyleAnimator.init()))
        v2.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: BouncesStyleAnimator.init()))
        v3.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: BouncesStyleAnimator.init()))
        v4.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: BouncesStyleAnimator.init()))
        v5.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: BouncesStyleAnimator.init()))
        
        v1.tabBarItem.image = UIImage.init(named: "home")
        v2.tabBarItem.image = UIImage.init(named: "find")
        v3.tabBarItem.image = UIImage.init(named: "cardboard")
        v4.tabBarItem.image = UIImage.init(named: "favor")
        v5.tabBarItem.image = UIImage.init(named: "me")
        v1.tabBarItem.selectedImage = UIImage.init(named: "home_1")
        v2.tabBarItem.selectedImage = UIImage.init(named: "find_1")
        v3.tabBarItem.selectedImage = UIImage.init(named: "cardboard_1")
        v4.tabBarItem.selectedImage = UIImage.init(named: "favor_1")
        v5.tabBarItem.selectedImage = UIImage.init(named: "me_1")
        
        v1.title        = "Home"
        v2.title        = "Find"
        v3.title        = "Cardboard"
        v4.title        = "List"
        v5.title        = "Me"
        
        let controllers = [v1, v2, v3, v4, v5]
        self.viewControllers = controllers
    }
    
}
