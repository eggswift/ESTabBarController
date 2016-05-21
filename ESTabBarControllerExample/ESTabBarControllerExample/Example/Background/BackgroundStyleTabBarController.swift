//
//  BackgroundStyleTabBarController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/21.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import Foundation
import UIKit

public class BackgroundStyleTabBarController: ESTabBarController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Instagram"
        self.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        self.hijackHandler = {
            [weak self] tabbarController, viewController, index in
            if index == 2 {
                self?.showPhoto()
            }
        }
        
        let v1          = ExampleViewController()
        let v2          = ExampleViewController()
        let v3          = ExampleViewController()
        let v4          = ExampleViewController()
        let v5          = ExampleViewController()
        
        let c1 = ESTabBarItemContent.init(animator: BackgroundStyleAnimator.init())
        let c2 = ESTabBarItemContent.init(animator: BackgroundStyleAnimator.init())
        let c3 = ESTabBarItemContent.init(animator: BackgroundStyleAnimator.init(special: true))
        let c4 = ESTabBarItemContent.init(animator: BackgroundStyleAnimator.init())
        let c5 = ESTabBarItemContent.init(animator: BackgroundStyleAnimator.init())
        
        c1.highlightEnabled = true
        c2.highlightEnabled = true
        c3.highlightEnabled = true
        c4.highlightEnabled = true
        c5.highlightEnabled = true
        
        v1.tabBarItem   = ESTabBarItem.init(content: c1)
        v2.tabBarItem   = ESTabBarItem.init(content: c2)
        v3.tabBarItem   = ESTabBarItem.init(content: BackgroundStyleTabBarItemContent.init(animator: BackgroundStyleAnimator.init(special: true)))
        v4.tabBarItem   = ESTabBarItem.init(content: c4)
        v5.tabBarItem   = ESTabBarItem.init(content: c5)
        
        v1.tabBarItem.image = UIImage.init(named: "home")
        v2.tabBarItem.image = UIImage.init(named: "find")
        v3.tabBarItem.image = UIImage.init(named: "photo_big")
        v4.tabBarItem.image = UIImage.init(named: "favor")
        v5.tabBarItem.image = UIImage.init(named: "me")
        v1.tabBarItem.selectedImage = UIImage.init(named: "home_1")
        v2.tabBarItem.selectedImage = UIImage.init(named: "find_1")
        v3.tabBarItem.selectedImage = UIImage.init(named: "photo_big_1")
        v4.tabBarItem.selectedImage = UIImage.init(named: "favor_1")
        v5.tabBarItem.selectedImage = UIImage.init(named: "me_1")
        
        let controllers = [v1, v2, v3, v4, v5]
        self.viewControllers = controllers
    }

    func showPhoto() {
        let minseconds = 0.2 * Double(NSEC_PER_SEC)
        let dtime = dispatch_time(DISPATCH_TIME_NOW, Int64(minseconds))
        dispatch_after(dtime, dispatch_get_main_queue() , {
            let v1 = ExampleViewController()
            let n1 = ExampleNavigationController.init(rootViewController: v1)
            v1.title = "Example"
            self.presentViewController(n1, animated: true, completion: nil)
        })
    }

}
