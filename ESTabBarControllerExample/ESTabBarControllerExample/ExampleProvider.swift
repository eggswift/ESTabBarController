//
//  ExampleProvider.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 2017/2/9.
//  Copyright © 2017年 Vincent Li. All rights reserved.
//

import UIKit

enum ExampleProvider {
    static func systemStyle() -> UITabBarController {
        let tabBarController = UITabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = UITabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = UITabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    static func customStyle() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = ESTabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    static func mixtureStyle() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    static func systemMoreStyle() -> UITabBarController {
        let tabBarController = UITabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        let v6 = ExampleViewController()
        let v7 = ExampleViewController()
        let v8 = ExampleViewController()
        
        v1.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = UITabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = UITabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        v6.tabBarItem = UITabBarItem.init(title: "Message", image: UIImage(named: "message"), selectedImage: UIImage(named: "message_1"))
        v7.tabBarItem = UITabBarItem.init(title: "Shop", image: UIImage(named: "shop"), selectedImage: UIImage(named: "shop_1"))
        v8.tabBarItem = UITabBarItem.init(title: "Cardboard", image: UIImage(named: "cardboard"), selectedImage: UIImage(named: "cardboard_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5, v6, v7, v8]
        
        return tabBarController
    }
    
    static func customMoreStyle() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        let v6 = ExampleViewController()
        let v7 = ExampleViewController()
        let v8 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = ESTabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        v6.tabBarItem = ESTabBarItem.init(title: "Message", image: UIImage(named: "message"), selectedImage: UIImage(named: "message_1"))
        v7.tabBarItem = ESTabBarItem.init(title: "Shop", image: UIImage(named: "shop"), selectedImage: UIImage(named: "shop_1"))
        v8.tabBarItem = ESTabBarItem.init(title: "Cardboard", image: UIImage(named: "cardboard"), selectedImage: UIImage(named: "cardboard_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5, v6, v7, v8]
        
        return tabBarController
    }
    
    static func mixtureMoreStyle() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        let v6 = ExampleViewController()
        let v7 = ExampleViewController()
        let v8 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        v6.tabBarItem = UITabBarItem.init(title: "Message", image: UIImage(named: "message"), selectedImage: UIImage(named: "message_1"))
        v7.tabBarItem = ESTabBarItem.init(title: "Shop", image: UIImage(named: "shop"), selectedImage: UIImage(named: "shop_1"))
        v8.tabBarItem = UITabBarItem.init(title: "Cardboard", image: UIImage(named: "cardboard"), selectedImage: UIImage(named: "cardboard_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5, v6, v7, v8]
        
        return tabBarController
    }
    
    static func navigationWithTabbarStyle() -> ExampleNavigationController {
        let tabBarController = ExampleProvider.customStyle()
        let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }
    
    static func tabbarWithNavigationStyle() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = ESTabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        let n1 = ExampleNavigationController.init(rootViewController: v1)
        let n2 = ExampleNavigationController.init(rootViewController: v2)
        let n3 = ExampleNavigationController.init(rootViewController: v3)
        let n4 = ExampleNavigationController.init(rootViewController: v4)
        let n5 = ExampleNavigationController.init(rootViewController: v5)
        
        v1.title = "Home"
        v2.title = "Find"
        v3.title = "Photo"
        v4.title = "List"
        v5.title = "Me"
        
        tabBarController.viewControllers = [n1, n2, n3, n4, n5]

        return tabBarController
    }
    
    static func customColorStyle() -> ExampleNavigationController {
        let tabBarController = ESTabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        v1.tabBarItem = ESTabBarItem.init(ExampleBasicContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleBasicContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleBasicContentView(), title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = ESTabBarItem.init(ExampleBasicContentView(), title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleBasicContentView(), title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }
    
    static func customBouncesStyle() -> ExampleNavigationController {
        let tabBarController = ESTabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        v1.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }
    
    static func customBackgroundColorStyle(implies: Bool) -> ExampleNavigationController {
        let tabBarController = ESTabBarController()
        if let tabBar = tabBarController.tabBar as? ESTabBar {
            tabBar.itemCustomPositioning = .fillIncludeSeparator
        }
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(ExampleBackgroundContentView(), title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleBackgroundContentView(), title: nil, image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleBackgroundContentView.init(specialWithAutoImplies: implies), title: nil, image: UIImage(named: "photo_big"), selectedImage: UIImage(named: "photo_big_1"))
        v4.tabBarItem = ESTabBarItem.init(ExampleBackgroundContentView(), title: nil, image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleBackgroundContentView(), title: nil, image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }
    
    static func customHighlightableStyle() -> ExampleNavigationController {
        let tabBarController = ESTabBarController()
        if let tabBar = tabBarController.tabBar as? ESTabBar {
            tabBar.itemCustomPositioning = .fillIncludeSeparator
        }
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(ExampleHighlightableContentView(), title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleHighlightableContentView(), title: nil, image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleHighlightableContentView(), title: nil, image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = ESTabBarItem.init(ExampleHighlightableContentView(), title: nil, image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleHighlightableContentView(), title: nil, image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }
    
    static func customIrregularityStyle(delegate: UITabBarControllerDelegate?) -> ExampleNavigationController {
        let tabBarController = ESTabBarController()
        tabBarController.delegate = delegate
        tabBarController.title = "Irregularity"
        tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
        tabBarController.tabBar.backgroundImage = UIImage(named: "background_dark")
        tabBarController.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        tabBarController.didHijackHandler = {
            [weak tabBarController] tabbarController, viewController, index in
            
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
				let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
				let takePictureAction = UIAlertAction(title: "拍照", style: .default, handler: nil)
				alertController.addAction(takePictureAction)
				let selectFromAlbumAction = UIAlertAction(title: "从相册选取", style: .default, handler: nil)
				alertController.addAction(selectFromAlbumAction)
				let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
				alertController.addAction(cancelAction)
				tabBarController?.present(alertController, animated: true, completion: nil)
			}
        }

        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "photo_verybig"), selectedImage: UIImage(named: "photo_verybig"))
        v4.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }
    
    static func customTipsStyle(delegate: UITabBarControllerDelegate?) -> ExampleNavigationController {
        let tabBarController = ESTabBarController()
        tabBarController.delegate = delegate
        tabBarController.title = "Irregularity"
        tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
        tabBarController.tabBar.backgroundImage = UIImage(named: "background_dark")
        
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(ExampleTipsBasicContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleTipsBasicContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleTipsBasicContentView(), title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = ESTabBarItem.init(ExampleTipsBasicContentView(), title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleTipsContentView(), title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }
    
    static func systemRemindStyle() -> UITabBarController {
        let tabBarController = UITabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = UITabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = UITabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))

        v1.tabBarItem.badgeValue = "New"
        v2.tabBarItem.badgeValue = "99+"
        v3.tabBarItem.badgeValue = "1"
        if let tabBarItem = v3.tabBarItem as? ESTabBarItem {
            tabBarItem.badgeColor = UIColor.blue
        }
        v4.tabBarItem.badgeValue = ""
        v5.tabBarItem.badgeValue = nil
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]

        return tabBarController
    }
    
    static func customRemindStyle() -> UITabBarController {
        let tabBarController = ESTabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = ESTabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        if let tabBarItem = v1.tabBarItem as? ESTabBarItem {
            tabBarItem.badgeValue = "New"
        }
        if let tabBarItem = v2.tabBarItem as? ESTabBarItem {
            tabBarItem.badgeValue = "99+"
        }
        if let tabBarItem = v3.tabBarItem as? ESTabBarItem {
            tabBarItem.badgeValue = "1"
            tabBarItem.badgeColor = UIColor.blue
        }
        if let tabBarItem = v4.tabBarItem as? ESTabBarItem {
            tabBarItem.badgeValue = ""
        }
        if let tabBarItem = v5.tabBarItem as? ESTabBarItem {
            tabBarItem.badgeValue = nil
        }
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
    
        return tabBarController
    }
    
    static func customAnimateRemindStyle(implies: Bool) -> ExampleNavigationController {
        let tabBarController = ESTabBarController()
        if let tabBar = tabBarController.tabBar as? ESTabBar {
            tabBar.itemCustomPositioning = .fillIncludeSeparator
        }
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView(), title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView(), title: nil, image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView.init(specialWithAutoImplies: implies), title: nil, image: UIImage(named: "photo_big"), selectedImage: UIImage(named: "photo_big_1"))
        v4.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView(), title: nil, image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView(), title: nil, image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        if let tabBarItem = v2.tabBarItem as? ESTabBarItem {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                tabBarItem.badgeValue = "1"
            }
        }
        
        let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }
    
    static func customAnimateRemindStyle2(implies: Bool) -> ExampleNavigationController {
        let tabBarController = ESTabBarController()
        if let tabBar = tabBarController.tabBar as? ESTabBar {
            tabBar.itemCustomPositioning = .fillIncludeSeparator
        }
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView2(), title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView2(), title: nil, image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView2.init(specialWithAutoImplies: implies), title: nil, image: UIImage(named: "photo_big"), selectedImage: UIImage(named: "photo_big_1"))
        v4.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView2(), title: nil, image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView2(), title: nil, image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        if let tabBarItem = v2.tabBarItem as? ESTabBarItem {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                tabBarItem.badgeValue = "1"
            }
        }
        
        let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }

    static func customAnimateRemindStyle3(implies: Bool) -> ExampleNavigationController {
        let tabBarController = ESTabBarController()
        if let tabBar = tabBarController.tabBar as? ESTabBar {
            tabBar.itemCustomPositioning = .fillIncludeSeparator
        }
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView3(), title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView3(), title: nil, image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView3.init(specialWithAutoImplies: implies), title: nil, image: UIImage(named: "photo_big"), selectedImage: UIImage(named: "photo_big_1"))
        v4.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView3(), title: nil, image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleAnimateTipsContentView3(), title: nil, image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        if let tabBarItem = v2.tabBarItem as? ESTabBarItem {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                tabBarItem.badgeValue = "1"
            }
        }
        
        let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }
    
    static func lottieSytle() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = ESTabBarItem.init(ExampleLottieAnimateBasicContentView(), title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleLottieAnimateBasicContentView(), title: nil, image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleLottieAnimateContentView(), title: nil, image: nil, selectedImage: nil)
        v4.tabBarItem = ESTabBarItem.init(ExampleLottieAnimateBasicContentView(), title: nil, image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleLottieAnimateBasicContentView(), title: nil, image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }

}
