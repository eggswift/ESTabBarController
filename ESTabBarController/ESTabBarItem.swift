//
//  ESTabBarItem.swift
//
//  Created by egg swift on 16/4/7.
//  Copyright (c) 2013-2016 ESPullToRefresh (https://github.com/eggswift/ESTabBarController)
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
/*
 *  ESTabBarItem 自定义可动画TabBarItem类
 *  为TabBarItem添加是否允许选中属性
 *  不需要再实现 shouldSelectViewController 方法
 */

import Foundation
import UIKit

public class ESTabBarItem: UITabBarItem {
    
    public weak var tabBarController: ESTabBarController?
    public var index: Int = 0
    public var content: ESTabBarItemContent?
    public var badge: ESTabBarBadge?
    
    // 重写系统的setImage: 和setTitle 方法 使其作用于自定义的container上
    public override var image: UIImage? {
        set { self.content?.image = newValue }
        get { return nil }
    }
    public override var selectedImage: UIImage? {
        set { self.content?.selectedImage = newValue }
        get { return nil }
    }
    public override var title: String? {
        set { self.content?.title = newValue }
        get { return nil }
    }

    public convenience init(animator: ESTabBarItemAnimatorProtocol) {
        self.init()
        let content = ESTabBarItemContent.init(animator: animator)
        content.item = self
        self.content = content
        self.content?.deselect(animated: false, completion: nil)
    }
    
    public convenience init(content: ESTabBarItemContent?) {
        self.init()
        self.content = content
        self.content?.item = self
        self.content?.deselect(animated: false, completion: nil)
    }
    
    public func select(animated animated: Bool, completion: (() -> ())?){
        content?.select(animated: animated, completion: completion)
    }
    
    public func reselect(animated animated: Bool, completion: (() -> ())?){
        content?.reselect(animated: animated, completion: completion)
    }
    
    public func deselect(animated animated: Bool, completion: (() -> ())?){
        content?.deselect(animated: animated, completion: completion)
    }
    
    public func highlight(highlight highlight: Bool, animated: Bool, completion: (() -> ())?){
        content?.highlight(highlight: highlight, animated: animated, completion: completion)
    }


}


extension ESTabBarItem /* BadgeExtension */ {
    
    /// Support value: nil or "" or "xx", 
    /// if value > 99, set "99+"
    /// if value > "xx...", set "xx."
    override public var badgeValue: String? {
        get {
            return badge?.badgeValue ?? nil
        }
        set(newValue) {
            self.content?.badgeValue = newValue
        }
    }

}

private var kSelectEnabledAssociateKey: String = ""
extension UITabBarItem {
    var selectEnabled: Bool? {
        get {
            let obj = (objc_getAssociatedObject(self, &kSelectEnabledAssociateKey) as? NSNumber)
            return obj?.boolValue
        }
        set(newValue) {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &kSelectEnabledAssociateKey, NSNumber.init(bool: newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
    }
}

extension NSObjectProtocol where Self: UITabBarControllerDelegate {
    func tabBarController(tabBarcontroller: UITabBarController?, shouldSelectViewController viewController: UIViewController) -> Bool {
        return viewController.tabBarItem.selectEnabled ?? true
    }
}
