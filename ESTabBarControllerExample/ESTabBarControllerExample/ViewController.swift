//
//  ViewController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/13.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UITabBarControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataArray = [
        /// Common show
        "Push system style TabBarController",
        "Push custom TabBarController",
        ///
        "Navigation contain tabBar style",
        "TabBar contain Navigation style",
        /// Background
        "Background changeable style TabBarController",
        /// Animatable
        "Push animatable TabBarController",
        "Present animatable TabBarController",
        /// Irregularity
        "Push irregularity style TabBarController",
        "Present irregularity style TabBarController",
        /// Highlight
        "Highlight style",
        /// Hijack
        "Hijack style",
        /// Implies
        "Implies style"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(white: 245.0 / 255.0, alpha: 1.0)
        self.navigationItem.title = "Example"
        if tableView != nil {
            tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 52.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        cell?.textLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
        cell?.textLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
        cell?.textLabel?.text = "\(indexPath.row + 1).  " + dataArray[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.size.width, height: 0.5))
        view.backgroundColor = UIColor.lightGrayColor()
        return view
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            systemStytle()
            break
        case 1:
            pushTabBarStyle()
            break
        case 2:
            naviContainTabBarStytle()
            break
        case 3:
            tabBarContainNaviStytle()
            break
        case 4:
            backgroundChangeableTabBarStyle(false, highlightable: false, implies: false)
            break
        case 5:
            animatableTabBarStyle(true)
            break
        case 6:
            animatableTabBarStyle(false)
            break
        case 7:
            irregularityTabBarStyle(true, hijack: false)
            break
        case 8:
            irregularityTabBarStyle(false, hijack: false)
            break
        case 9:
            backgroundChangeableTabBarStyle(false, highlightable: true, implies: false)
            break
        case 10:
            irregularityTabBarStyle(false, hijack: true)
            break
        case 11:
            backgroundChangeableTabBarStyle(false, highlightable: false, implies: true)
            break
        default:
            
            break
        }
    }
    
}

extension ViewController /**/ {
    
    func systemStytle() {
        let vc = ESTabBarController.init()
        vc.title = "Example"
        
        let v1          = ExampleViewController()
        let v2          = ExampleViewController()
        let v3          = ExampleViewController()
        let v4          = ExampleViewController()
        let v5          = ExampleViewController()
        let v6          = ExampleViewController()
        let v7          = ExampleViewController()
        let v8          = ExampleViewController()
        let v9          = ExampleViewController()
        
        v1.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ESTabBarItemAnimator.init()))
        v2.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ESTabBarItemAnimator.init()))
        v3.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ESTabBarItemAnimator.init()))
        v4.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ESTabBarItemAnimator.init()))
        v5.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ESTabBarItemAnimator.init()))
        v6.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ESTabBarItemAnimator.init()))
        v7.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ESTabBarItemAnimator.init()))
        v8.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ESTabBarItemAnimator.init()))
        v9.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ESTabBarItemAnimator.init()))

        v1.tabBarItem.image = UIImage.init(named: "home")
        v2.tabBarItem.image = UIImage.init(named: "find")
        v3.tabBarItem.image = UIImage.init(named: "photo")
        v4.tabBarItem.image = UIImage.init(named: "favor")
        v5.tabBarItem.image = UIImage.init(named: "me")
        v6.tabBarItem.image = UIImage.init(named: "message")
        v7.tabBarItem.image = UIImage.init(named: "shop")
        v8.tabBarItem.image = UIImage.init(named: "cardboard")
        
        v1.tabBarItem.selectedImage = UIImage.init(named: "home_1")
        v2.tabBarItem.selectedImage = UIImage.init(named: "find_1")
        v3.tabBarItem.selectedImage = UIImage.init(named: "photo_1")
        v4.tabBarItem.selectedImage = UIImage.init(named: "favor_1")
        v5.tabBarItem.selectedImage = UIImage.init(named: "me_1")
        v6.tabBarItem.selectedImage = UIImage.init(named: "message_1")
        v7.tabBarItem.selectedImage = UIImage.init(named: "shop_1")
        v8.tabBarItem.selectedImage = UIImage.init(named: "cardboard_1")
        
        v1.title        = "Home"
        v2.title        = "Find"
        v3.title        = "Photo"
        v4.title        = "List"
        v5.title        = "Me"
        v6.title        = "Message"
        v7.title        = "Shop"
        v8.title        = "Cardboard"
        v9.title        = "More4"
        
        let controllers = [v1, v2, v3, v4, v5, v6, v7, v8, v9]
        vc.viewControllers = controllers
        
        let nc = ExampleNavigationController.init(rootViewController: vc)
        self.presentViewController(nc, animated: true) {
            
        }
    }
    
    
    func naviContainTabBarStytle() {
        let vc = ESTabBarController.init()
        vc.title = "Example"
        
        let v1          = ExampleViewController()
        let v2          = ExampleViewController()
        let v3          = ExampleViewController()
        let v4          = ExampleViewController()
        let v5          = ExampleViewController()
        
        v1.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        v2.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        v3.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        v4.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        v5.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        
        v1.tabBarItem.image = UIImage.init(named: "home")
        v2.tabBarItem.image = UIImage.init(named: "find")
        v3.tabBarItem.image = UIImage.init(named: "photo")
        v4.tabBarItem.image = UIImage.init(named: "favor")
        v5.tabBarItem.image = UIImage.init(named: "me")
        v1.tabBarItem.selectedImage = UIImage.init(named: "home_1")
        v2.tabBarItem.selectedImage = UIImage.init(named: "find_1")
        v3.tabBarItem.selectedImage = UIImage.init(named: "photo_1")
        v4.tabBarItem.selectedImage = UIImage.init(named: "favor_1")
        v5.tabBarItem.selectedImage = UIImage.init(named: "me_1")
        
        v1.title        = "Home"
        v2.title        = "Find"
        v3.title        = "Message"
        v4.title        = "List"
        v5.title        = "Me"
        
        let controllers = [v1, v2, v3, v4, v5]
        vc.viewControllers = controllers
        
        let nc = ExampleNavigationController.init(rootViewController: vc)
        self.presentViewController(nc, animated: true) { 

        }
    }
    
    func tabBarContainNaviStytle() {
        let vc = ESTabBarController.init()
        vc.title = "Example"
        
        let v1          = ExampleViewController()
        let v2          = ExampleViewController()
        let v3          = ExampleViewController()
        let v4          = ExampleViewController()
        let v5          = ExampleViewController()
        
        let n1 = ExampleNavigationController.init(rootViewController: v1)
        let n2 = ExampleNavigationController.init(rootViewController: v2)
        let n3 = ExampleNavigationController.init(rootViewController: v3)
        let n4 = ExampleNavigationController.init(rootViewController: v4)
        let n5 = ExampleNavigationController.init(rootViewController: v5)
        
        n1.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        n2.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        n3.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        n4.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        n5.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        
        n1.tabBarItem.image = UIImage.init(named: "home")
        n2.tabBarItem.image = UIImage.init(named: "find")
        n3.tabBarItem.image = UIImage.init(named: "photo")
        n4.tabBarItem.image = UIImage.init(named: "favor")
        n5.tabBarItem.image = UIImage.init(named: "me")
        n1.tabBarItem.selectedImage = UIImage.init(named: "home_1")
        n2.tabBarItem.selectedImage = UIImage.init(named: "find_1")
        n3.tabBarItem.selectedImage = UIImage.init(named: "photo_1")
        n4.tabBarItem.selectedImage = UIImage.init(named: "favor_1")
        n5.tabBarItem.selectedImage = UIImage.init(named: "me_1")
        
        v1.title        = "Home"
        v2.title        = "Find"
        v3.title        = "Photo"
        v4.title        = "List"
        v5.title        = "Me"
        
        let controllers = [n1, n2, n3, n4, n5]
        vc.viewControllers = controllers
        self.presentViewController(vc, animated: true) {
            
        }
    }
    
    func pushTabBarStyle() {
        let vc = ESTabBarController.init()
        vc.title = "Example"
        
        let v1          = ExampleViewController()
        let v2          = ExampleViewController()
        let v3          = ExampleViewController()
        let v4          = ExampleViewController()
        let v5          = ExampleViewController()
        
        v1.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        v2.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        v3.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        v4.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        v5.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBaseAnimator.init()))
        
        v1.tabBarItem.image = UIImage.init(named: "home")
        v2.tabBarItem.image = UIImage.init(named: "find")
        v3.tabBarItem.image = UIImage.init(named: "photo")
        v4.tabBarItem.image = UIImage.init(named: "favor")
        v5.tabBarItem.image = UIImage.init(named: "me")
        v1.tabBarItem.selectedImage = UIImage.init(named: "home_1")
        v2.tabBarItem.selectedImage = UIImage.init(named: "find_1")
        v3.tabBarItem.selectedImage = UIImage.init(named: "photo_1")
        v4.tabBarItem.selectedImage = UIImage.init(named: "favor_1")
        v5.tabBarItem.selectedImage = UIImage.init(named: "me_1")
        
        v1.title        = "Home"
        v2.title        = "Find"
        v3.title        = "Photo"
        v4.title        = "List"
        v5.title        = "Me"
        
        let controllers = [v1, v2, v3, v4, v5]
        vc.viewControllers = controllers
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func backgroundChangeableTabBarStyle(push: Bool, highlightable: Bool, implies: Bool) {
        let vc = ESTabBarController.init()
        vc.title = "Example"
        vc.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        
        
        vc.hijackHandler = {
            [weak vc] tabbarController, viewController, index in
            if index == 2 {
                let minseconds = 0.2 * Double(NSEC_PER_SEC)
                let dtime = dispatch_time(DISPATCH_TIME_NOW, Int64(minseconds))
                dispatch_after(dtime, dispatch_get_main_queue() , {
                    let v1 = ExampleViewController()
                    let n1 = ExampleNavigationController.init(rootViewController: v1)
                    v1.title = "Example"
                    vc?.presentViewController(n1, animated: true, completion: nil)
                })
            }
        }
        
        let v1          = ExampleViewController()
        let v2          = ExampleViewController()
        let v3          = ExampleViewController()
        let v4          = ExampleViewController()
        let v5          = ExampleViewController()
        
        let c1 = ESTabBarItemContent.init(animator: ExampleBackgroundAnimator.init())
        let c2 = ESTabBarItemContent.init(animator: ExampleBackgroundAnimator.init())
        let c3 = ESTabBarItemContent.init(animator: ExampleBackgroundAnimator.init(special: true))
        let c4 = ESTabBarItemContent.init(animator: ExampleBackgroundAnimator.init())
        let c5 = ESTabBarItemContent.init(animator: ExampleBackgroundAnimator.init())
        
        c1.highlightEnabled = highlightable
        c2.highlightEnabled = highlightable
        c3.highlightEnabled = highlightable
        c4.highlightEnabled = highlightable
        c5.highlightEnabled = highlightable
        
        v1.tabBarItem   = ESTabBarItem.init(content: c1)
        v2.tabBarItem   = ESTabBarItem.init(content: c2)
        if implies == false {
            v3.tabBarItem = ESTabBarItem.init(content: c3)
        } else {
            v3.tabBarItem = ESTabBarItem.init(content: ExampleImpliesTabBarItemContent.init(animator: ExampleBackgroundAnimator.init(special: true)))
        }
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
        vc.viewControllers = controllers
        
        if push {
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let nc = ExampleNavigationController.init(rootViewController: vc)
            nc.navigationBar.barTintColor = UIColor.init(red: 17/255.0, green: 86/255.0, blue: 136/255.0, alpha: 1.0)
            nc.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName: UIFont.init(name: "ChalkboardSE-Bold", size: 17.0)!]
            nc.navigationBar.tintColor = UIColor.whiteColor()
            nc.navigationBar.shadowImage = UIImage.init()
            self.presentViewController(nc, animated: true) {
                
            }
        }
    }
    
    func animatableTabBarStyle(push: Bool) {
        let vc = ESTabBarController.init()
        vc.title = "Example"
        
        let v1          = ExampleViewController()
        let v2          = ExampleViewController()
        let v3          = ExampleViewController()
        let v4          = ExampleViewController()
        let v5          = ExampleViewController()
        
        v1.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBounceAnimator.init()))
        v2.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBounceAnimator.init()))
        v3.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBounceAnimator.init()))
        v4.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBounceAnimator.init()))
        v5.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBounceAnimator.init()))
        
        v1.tabBarItem.image = UIImage.init(named: "home")
        v2.tabBarItem.image = UIImage.init(named: "find")
        v3.tabBarItem.image = UIImage.init(named: "photo")
        v4.tabBarItem.image = UIImage.init(named: "favor")
        v5.tabBarItem.image = UIImage.init(named: "me")
        v1.tabBarItem.selectedImage = UIImage.init(named: "home_1")
        v2.tabBarItem.selectedImage = UIImage.init(named: "find_1")
        v3.tabBarItem.selectedImage = UIImage.init(named: "photo_1")
        v4.tabBarItem.selectedImage = UIImage.init(named: "favor_1")
        v5.tabBarItem.selectedImage = UIImage.init(named: "me_1")
        
        v1.title        = "Home"
        v2.title        = "Find"
        v3.title        = "Photo"
        v4.title        = "List"
        v5.title        = "Me"
        
        let controllers = [v1, v2, v3, v4, v5]
        vc.viewControllers = controllers
        
        if push {
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let nc = ExampleNavigationController.init(rootViewController: vc)
            self.presentViewController(nc, animated: true) {
                
            }
        }
    }
    
    func irregularityTabBarStyle(push: Bool, hijack: Bool) {
        let vc = ESTabBarController.init()
        vc.tabBar.translucent = false
        vc.tabBar.barTintColor = UIColor.init(white: 220 / 255.0, alpha: 1.0)
        vc.tabBar.shadowImage = UIImage(named: "transparent")
        vc.tabBar.backgroundImage = UIImage(named: "background")
        vc.title = "Example"
        
        vc.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        
        
        vc.hijackHandler = {
            [weak vc] tabbarController, viewController, index in
            if index == 2 {
                let minseconds = 0.25 * Double(NSEC_PER_SEC)
                let dtime = dispatch_time(DISPATCH_TIME_NOW, Int64(minseconds))
                dispatch_after(dtime, dispatch_get_main_queue() , {
                    let v1 = ExampleViewController()
                    let n1 = ExampleNavigationController.init(rootViewController: v1)
                    v1.title = "Example"
                    vc?.presentViewController(n1, animated: true, completion: nil)
                })
            }
        }
        
        let v1          = ExampleViewController()
        let v2          = ExampleViewController()
        let v3          = ExampleViewController()
        let v4          = ExampleViewController()
        let v5          = ExampleViewController()
        
        v1.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBounceAnimator.init()))
        v2.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBounceAnimator.init()))
        
        let content3 = ESTabBarItemContent.init(animator: ExampleSpreadAnimator.init())
        content3.imageView.backgroundColor = UIColor.whiteColor()
        content3.imageView.layer.borderWidth = 1.5
        content3.imageView.layer.borderColor = UIColor.init(white: 235 / 255.0, alpha: 1.0).CGColor
        content3.imageView.layer.cornerRadius = 35
        content3.insets = UIEdgeInsetsMake(-32, 0, 0, 0)
        v3.tabBarItem   = ESTabBarItem.init(content: content3)
        
        v4.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBounceAnimator.init()))
        v5.tabBarItem   = ESTabBarItem.init(content: ESTabBarItemContent.init(animator: ExampleBounceAnimator.init()))
        
        v1.tabBarItem.image = UIImage.init(named: "home")
        v2.tabBarItem.image = UIImage.init(named: "find")
        v3.tabBarItem.image = UIImage.init(named: "photo_verybig")
        v4.tabBarItem.image = UIImage.init(named: "favor")
        v5.tabBarItem.image = UIImage.init(named: "me")
        v1.tabBarItem.selectedImage = UIImage.init(named: "home_1")
        v2.tabBarItem.selectedImage = UIImage.init(named: "find_1")
        v3.tabBarItem.selectedImage = UIImage.init(named: "photo_verybig_1")
        v4.tabBarItem.selectedImage = UIImage.init(named: "favor_1")
        v5.tabBarItem.selectedImage = UIImage.init(named: "me_1")

        let controllers = [v1, v2, v3, v4, v5]
        vc.viewControllers = controllers
        
        if push {
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let nc = ExampleNavigationController.init(rootViewController: vc)
            self.presentViewController(nc, animated: true) {
                
            }
        }
    }
    
}

