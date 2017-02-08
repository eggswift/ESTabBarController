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
        "System style",
        "Present style",
        
        /// UI level
        "Navigation contain tabBar style",
        "TabBar contain navigation style",
        
        /// Customize
        "Bounce",
        "Background highlight",
        "Irregularity",
        "Notification"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(white: 245.0 / 255.0, alpha: 1.0)
        self.navigationItem.title = "Example"
        if tableView != nil {
            tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52.0
    }

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
		cell?.textLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
		cell?.textLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
		cell?.textLabel?.text = "\(indexPath.row + 1).  " + dataArray[indexPath.row]
		return cell!
	}
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.size.width, height: 0.5))
        view.backgroundColor = .blue
        return view
    }
	
	
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            systemStytle()
        case 1:
            pushTabBarStyle()
        case 2:
            naviContainTabBarStytle()
        case 3:
            tabBarContainNaviStytle()
        case 4:
            let vc = BouncesStyleTabBarController.init()
            self.present(vc: vc)
        case 5:
            let vc = BackgroundStyleTabBarController.init()
            self.present(vc: vc)
        case 6:
            let vc = IrregularityStyleTabBarController.init()
            self.present(vc: vc)
        case 7:
            let vc = NotificationStyleTabBarController.init()
            self.present(vc: vc)
        default:
            
            break
        }
    }

    func present(vc: UIViewController) {
        let nc = ExampleNavigationController.init(rootViewController: vc)
        nc.navigationBar.barTintColor = UIColor.init(red: 17/255.0, green: 86/255.0, blue: 136/255.0, alpha: 1.0)
        nc.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName: UIFont.init(name: "ChalkboardSE-Bold", size: 17.0)!]
        nc.navigationBar.tintColor = .white
        nc.navigationBar.shadowImage = UIImage.init()
        self.present(nc, animated: true, completion: nil)
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
        self.present(nc, animated: true) {
            
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
        self.present(nc, animated: true) { 

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
        self.present(vc, animated: true) {
            
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
    
}

