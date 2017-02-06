//
//  BouncesStyleTabBarController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/21.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit

public class IrregularityStyleTabBarController: ESTabBarController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Irregularity"
        self.tabBar.shadowImage = UIImage(named: "transparent")
        self.tabBar.backgroundImage = UIImage(named: "background_dark")
        
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
        
        v1.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: IrregularityBasicStyleAnimator.init()))
        v2.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: IrregularityBasicStyleAnimator.init()))
        v3.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: IrregularityStyleAnimator.init()))
        v4.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: IrregularityBasicStyleAnimator.init()))
        v5.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: IrregularityBasicStyleAnimator.init()))
        
        v1.tabBarItem.image = UIImage.init(named: "home")
        v2.tabBarItem.image = UIImage.init(named: "find")
        v3.tabBarItem.image = UIImage.init(named: "photo_verybig")
        v4.tabBarItem.image = UIImage.init(named: "favor")
        v5.tabBarItem.image = UIImage.init(named: "me")
        
        let controllers = [v1, v2, v3, v4, v5]
        self.viewControllers = controllers
    }
    
    func showPhoto() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.28) {
			let v1 = ExampleViewController()
			let n1 = ExampleNavigationController.init(rootViewController: v1)
			v1.title = "Example"
			self.present(n1, animated: true, completion: nil)
		}
    }
    
}
