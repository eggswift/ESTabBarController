//
//  ExampleTabBarItemContent.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/17.
//  Copyright © 2016年 Egg Swift. All rights reserved.
//

import UIKit

public class ExampleBaseAnimator: ESTabBarItemAnimator {
    public var duration = 0.3
    
    override init() {
        super.init()
        textColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightTextColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
        iconColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
        backgroundColor = UIColor.clearColor()
        highlightBackgroundColor = UIColor.clearColor()
    }
    
}
