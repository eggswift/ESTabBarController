//
//  ExampleNavigationController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/16.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit

class ExampleNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName: UIFont.init(name: "ChalkboardSE-Bold", size: 17.0)!]
        self.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationBar.shadowImage = UIImage.init()
    }
    
}
