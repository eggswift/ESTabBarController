//
//  ESTabBarItemMoreContentView.swift
//
//  Created by Vincent Li on 2017/2/8.
//  Copyright (c) 2013-2016 ESTabBarController (https://github.com/eggswift/ESTabBarController)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit


open class ESTabBarItemMoreContentView: ESTabBarItemContentView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.title = "More"
        self.image = systemTypeMore(selected:false)
        self.selectedImage = systemTypeMore(selected:true)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// draw More image
func systemTypeMore(selected:Bool) -> UIImage! {
    // create empty image for drawing
    let image = UIImage()
    let circleDiameter  = selected ? 5 : 4;
    
    UIGraphicsBeginImageContextWithOptions(CGSize.init(width: 32, height: 32), false, UIScreen.main.scale) // different scale for different screen
    let context = UIGraphicsGetCurrentContext()!
    context.setLineWidth(1)
    // draw Three dots
    for index in 0...2 {
        let tmpRect = CGRect.init(x: 5 + 9*index, y: 14, width: circleDiameter, height: circleDiameter)
        context.addEllipse(in: tmpRect)
        image.draw(in: tmpRect)
    }
    // selected or not
    if selected {
        context.setFillColor(UIColor.blue.cgColor)
        context.fillPath()
    } else {
        context.strokePath()
    }
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage
}



