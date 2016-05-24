//
//  ESTabBarController.swift
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

import Foundation
import UIKit

public typealias ESTabBarShouldHijackHandler = ((tabBarController: UITabBarController, viewController: UIViewController, index: Int) -> (Bool))
public typealias ESTabBarHijackHandler = ((tabBarController: UITabBarController, viewController: UIViewController, index: Int) -> (Void))

public class ESTabBarController: UITabBarController {
    
    /// Array for containers of all the customize tabbars.
    /// ESTabBarController will auto-create ESTabBarConainer object as container.
    /// The ESTabBarConainer object can handle all touch events to impletement customize tabbar.
    private var containers = [String: AnyObject]()
    
    /// Whether to ignore animate. 
    /// Default is true because system will autoset selectedIndex = 0 at begining.
    private var ignoreNextAnimation = true
    
    /// Whether it has been initialized.
    /// This is a flag used to mark the current initialization state.
    /// Usually, we can set UITabBarControler's viewControllers before viewDidLoad()
    private var initialized = false
    
    /// Whether to hijack select action.
    public var shouldHijackHandler: ESTabBarShouldHijackHandler?
    /// Hijack select action.
    public var hijackHandler: ESTabBarHijackHandler?
    
    /// Auto reload when did set.
    public override var viewControllers: [UIViewController]? {
        didSet {
            self.initialized = true
            self.reload()
        }
    }
    
    /// Setting selectedIndex by manual.
    public override var selectedIndex: Int {
        willSet {
            guard ignoreNextAnimation == false else {
                return
            }
            guard let items = tabBar.items else {
                reportEmptyItems()
                return
            }
            let oldValue = selectedIndex
            if oldValue < items.count, let deselectItem = items[oldValue] as? ESTabBarItem {
                deselectItem.deselect(animated: true, completion: nil)
            }
            if newValue < items.count, let animationItem = items[newValue] as? ESTabBarItem {
                animationItem.select(animated: true, completion: nil)
            }
        }
    }
    
    /// This view controller is the one whose custom view is currently displayed by the tab bar interface. The specified view controller must be in the viewControllers array. Assigning a new view controller to this property changes the currently displayed view and also selects an appropriate tab in the tab bar. Changing the view controller also updates the selectedIndex property accordingly. The default value of this property is nil.
    /// UIMoreNavigationController don't need container or any customize.
    public override var selectedViewController: UIViewController? {
        willSet {
            guard let items = tabBar.items else {
                reportEmptyItems()
                return
            }
            if newValue == self.moreNavigationController {
                if selectedIndex < items.count, let deselectItem = items[selectedIndex] as? ESTabBarItem {
                    deselectItem.deselect(animated: true, completion: nil)
                }
            }
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if initialized == false {
            self.initialized = true
            self.reload()
        }
         */
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width = tabBar.frame.size.width
        let height = tabBar.frame.size.height
        let count = tabBar.items?.count ?? 0
        
        /*
        let spacing = tabBar.itemSpacing
        let itemWidth = tabBar.itemWidth
        let itemPositioning = tabBar.itemPositioning
        print("\(spacing)    \(itemWidth)    \(itemPositioning)")
         */
        
        // TODO: Adjust autolayout.
        // TODO: Work out the spacing bug with iPad.
        for index in 0..<count {
            if let container = containers["container\(index)"] as? UIView {
                container.frame = CGRect.init(x: width / CGFloat(count) * CGFloat(index), y: 0.0, width: width / CGFloat(count), height: height)
                for view in container.subviews {
                    if let view = view as? ESTabBarItemContent {
                        let rect = container.bounds
                        let insets = view.insets
                        view.frame = CGRect.init(x: rect.origin.x + insets.left, y: rect.origin.y + insets.top, width: rect.size.width - insets.left - insets.right, height: rect.size.height - insets.top - insets.bottom)
                    }
                }
            }
        }
    }

    // The system calls this method when the iOS interface environment changes. Implement this method in view controllers and views, according to your app’s needs, to respond to such changes. For example, you might adjust the layout of the subviews of a view controller when an iPhone is rotated from portrait to landscape orientation. The default implementation of this method is empty.
    public override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if self.traitCollection.verticalSizeClass != previousTraitCollection?.verticalSizeClass ||
            self.traitCollection.horizontalSizeClass != previousTraitCollection?.horizontalSizeClass {
            self.reload()
        }
    }
    
}

// MARK: - ESTabBarController+Containers
extension ESTabBarController /* Containers */ {
    
    private func removeAll() {
        for (_, view) in containers {
            view.removeFromSuperview()
        }
        containers.removeAll()
    }
    
    private func reload() {
        /// Remove all containers before create.
        /// It is very light weight because all of tabbar content are managed by tabbar item.
        removeAll()
        
        guard let items = tabBar.items else {
            /// Maybe there have a bug.
            reportEmptyItems()
            return
        }
        
        /// Create containers, If the current viewControllers more than 5, only add four container. (PS: Because the 5th is UIMoreNavigationController)
        let count = (moreNavigationController.parentViewController != nil) ? items.count - 1 : items.count
        for index in 0..<count {
            let container = ESTabBarConainer()
            container.tag = index
            /// ESTabBarConainer's actions: TouchUpInside   TouchDown   TouchDragEnter  TouchDragExit
            /// We need handle both select and highlight actions.
            container.addTarget(self, action: #selector(ESTabBarController.selectAction(_:)), forControlEvents: .TouchUpInside)
            container.addTarget(self, action: #selector(ESTabBarController.highlightAction(_:)), forControlEvents: .TouchDown)
            container.addTarget(self, action: #selector(ESTabBarController.highlightAction(_:)), forControlEvents: .TouchDragEnter)
            container.addTarget(self, action: #selector(ESTabBarController.dehighlightAction(_:)), forControlEvents: .TouchDragExit)
            container.backgroundColor = UIColor.clearColor()
            
            tabBar.addSubview(container)
            containers["container\(index)"] = container
            
            /// Add the item to the container animator
            if let item = items[index] as? ESTabBarItem {
                item.index = index
                item.tabBarController = self
                if let content = item.content {
                    container.addSubview(content)
                }
                if index == selectedIndex {
                    item.select(animated: false, completion: nil)
                } else {
                    item.deselect(animated: false, completion: nil)
                }
            }
        }
        
        /// Update containers layout
        self.view.setNeedsLayout()
    }
    
    internal func highlightAction(sender: AnyObject?) {
        guard let items = tabBar.items else {
            reportEmptyItems()
            return
        }
        guard let container = sender as? UIView else {
            reportInvalidContainer()
            return
        }
        
        let targetIndex = container.tag
        guard targetIndex < viewControllers?.count ?? 0 else {
            reportInvalidIndex(targetIndex)
            return
        }
        
        guard let vc = viewControllers?[targetIndex] else {
            return
        }
        
        /// Selectability check
        if vc.tabBarItem.enabled == false {
            return
        }
        if vc.tabBarItem.selectEnabled == false {
            return
        }
        
        // Check should select
        if let delegate = delegate {
            let shouldSelect = delegate.tabBarController?(self, shouldSelectViewController: vc) ?? true
            if shouldSelect == false {
                return
            }
        }
        
        // Check should hijack
        if let shouldHijackHandler = shouldHijackHandler {
            let shouldHijack = shouldHijackHandler(tabBarController: self, viewController: vc, index: targetIndex)
            if shouldHijack == true {
                // Do animate when hijack
                if targetIndex < items.count, let animationItem = items[targetIndex] as? ESTabBarItem {
                    animationItem.highlight(highlight: true, animated: true, completion: {
                        
                    })
                }
                return
            }
        }
        
        /// Do
        if targetIndex < items.count, let animationItem = items[targetIndex] as? ESTabBarItem {
            animationItem.highlight(highlight: true, animated: true, completion: nil)
        }
    }
    
    internal func dehighlightAction(sender: AnyObject?) {
        guard let items = tabBar.items else {
            reportEmptyItems()
            return
        }
        guard let container = sender as? UIView else {
            reportInvalidContainer()
            return
        }
        
        let targetIndex = container.tag
        guard targetIndex < viewControllers?.count ?? 0 else {
            reportInvalidIndex(targetIndex)
            return
        }
        
        guard let vc = viewControllers?[targetIndex] else {
            return
        }
        
        /// Selectability check
        if vc.tabBarItem.enabled == false {
            return
        }
        if vc.tabBarItem.selectEnabled == false {
            return
        }
        
        // Check should select
        if let delegate = delegate {
            let shouldSelect = delegate.tabBarController?(self, shouldSelectViewController: vc) ?? true
            if shouldSelect == false {
                return
            }
        }
        
        // Check should hijack
        if let shouldHijackHandler = shouldHijackHandler {
            let shouldHijack = shouldHijackHandler(tabBarController: self, viewController: vc, index: targetIndex)
            if shouldHijack == true {
                // Do animate when hijack
                if targetIndex < items.count, let animationItem = items[targetIndex] as? ESTabBarItem {
                    animationItem.highlight(highlight: false, animated: true, completion: {
                        
                    })
                }
                return
            }
        }
        
        /// Do
        if targetIndex < items.count, let animationItem = items[targetIndex] as? ESTabBarItem {
            animationItem.highlight(highlight: false, animated: true, completion: nil)
        }
    }
    
    internal func selectAction(sender: AnyObject?) {
        guard let items = tabBar.items else {
            reportEmptyItems()
            return
        }
        guard let container = sender as? UIView else {
            reportInvalidContainer()
            return
        }
        
        let targetIndex = container.tag
        let currentIndex = selectedIndex
        guard targetIndex < viewControllers?.count ?? 0 else {
            reportInvalidIndex(targetIndex)
            return
        }
        
        guard let vc = viewControllers?[targetIndex] else {
            return
        }
        
        /// Selectability check
        if vc.tabBarItem.enabled == false {
            return
        }
        if vc.tabBarItem.selectEnabled == false {
            return
        }
        
        // Check should select
        if let delegate = delegate {
            let shouldSelect = delegate.tabBarController?(self, shouldSelectViewController: vc) ?? true
            if shouldSelect == false {
                return
            }
        }

        // Check should hijack
        if let shouldHijackHandler = shouldHijackHandler {
            let shouldHijack = shouldHijackHandler(tabBarController: self, viewController: vc, index: targetIndex)
            if shouldHijack == true {
                self.hijackHandler?(tabBarController: self, viewController: vc, index: targetIndex)
                // Do animate when hijack
                if targetIndex < items.count, let animationItem = items[targetIndex] as? ESTabBarItem {
                    animationItem.select(animated: true, completion: {
                        animationItem.deselect(animated: false, completion: {
                            
                        })
                    })
                }
                return
            }
        }
        
        /// Do
        if currentIndex != targetIndex {
            if currentIndex < items.count, let deselectItem = items[currentIndex] as? ESTabBarItem {
                deselectItem.deselect(animated: true, completion: nil)
            }
            if targetIndex < items.count, let animationItem = items[targetIndex] as? ESTabBarItem {
                animationItem.select(animated: true, completion: nil)
            }
            ignoreNextAnimation = true
            selectedIndex = targetIndex
            // Delegate
            delegate?.tabBarController?(self, didSelectViewController: self)
            
        } else if currentIndex == targetIndex {
            /// Click the same again tab may require animation, so have the following:
            if currentIndex < items.count, let animationItem = items[currentIndex] as? ESTabBarItem {
                animationItem.reselect(animated: true, completion: nil)
            }
            if let navVC = viewControllers![selectedIndex] as? UINavigationController {
                navVC.popToRootViewControllerAnimated(true)
            }
        }
    }

}

extension ESTabBarController /* Error Report */ {
    private func reportEmptyItems() {
        print("ESTabBarController emtpy items")
    }
    
    private func reportInvalidIndex(index: Int) {
        print("ESTabBarController index \(index) invalid")
    }
    
    private func reportInvalidContainer() {
        print("ESTabBarController container invalid")
    }
}

internal class ESTabBarConainer: UIControl {
    
}

