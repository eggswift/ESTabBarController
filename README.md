<center>![logo](logo.png)</center>
</br>


[![Travis](https://img.shields.io/travis/eggwift/ESTabBarController.svg)](https://travis-ci.org/eggswift/ESTabBarController)
[![CocoaPods](https://img.shields.io/cocoapods/v/ESTabBarController-swift.svg)](http://cocoapods.org/pods/ESTabBarController-swift)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift 2.2](https://img.shields.io/badge/Swift-2.1-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Twitter](https://img.shields.io/badge/Twitter-@lihao_iOS-blue.svg?style=flat)](https://twitter.com/lihao_iOS)
[![Twitter](https://img.shields.io/badge/Weibo-@李昊_____-orange.svg?style=flat)](http://weibo.com/5120522686/profile?rightmod=1&wvr=6&mod=personinfo&is_all=1)

ESTabBarController is a Swift module to customize special tabbar item animations, and  it's inherited from UITabBarController.

## Why?

There are greate possibilities for us to customize UITabBar. For instance, changing the font, adding some animations, setting a larger item than default. However it's hard to realize these only by using UITabBarItem.

**With ESTabBarController, You can easily realize these and more !**

1. Nest any UITabBarController and UINavigationController objects as you want
2. Support Portrait, Landscape and Split View
3. Add more extra tabs to the More Item automatically
4. Changeable tabbar item font and images, customize irregular items
5. Some pre-set special select, deselect and slected animations
6. Hijack click event to jump page more flexibly
7. Realize user-guiding animation
8. Much more...

## Requirement

* Xcode 7.0 or later
* iOS 8.0 or later
* ARC

## Installation
### CocoaPods

```ruby
pod "ESTabBarController-swift"
```

### Carthage

```ruby
github "eggswift/ESTabBarController"
```

### Manually

```ruby
git clone https://github.com/eggswift/ESTabBarController.git
open ESTabBarController
```

## Usage

### Handle UI layers

Usually, there are two ways to handle layers when using `UITabBarController`:

First:

```swift
    - UITabBarController
    --- UINaviBarController
    ----- ViewController
    ------- SubViewController
```
Second:

```swift
    - UINaviBarController
    --- UITabBarController
    ----- ViewController
    ------- SubViewController
```

In the first situation, need to set `hidesBottomBarWhenPushed = true` when pushing subView. But not in the second one.

In ESTabBarController, to be compatible with the two ways by adding corresponding `container view` to UITabBar:

```swift
    func example() {
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

        let nc = ExampleNavigationController.init(rootViewController: vc)
        self.presentViewController(nc, animated: true) { 

        }
    }
```

For more examples, look over the following functions in`Example`

```swift
    func systemStytle() 
    func naviContainTabBarStytle() 
    func tabBarContainNaviStytle()
```

 Demo:

![](Example_GIFs/normal.gif)



### UIMoreNavigationController

If the count ofViewControllers is more than the default count，UITabBarController will combine extra Tabs to More Tab，and ESTabBarController support this situation  well. 
By doing this:

```swift
(moreNavigationController.parentViewController != nil) ? items.count - 1 : items.count 
```

to ensure the count of UITabBarItems which are need to add Container，if UITabBarController's object UIMoreNavigationController is exist and the parentViewController is not nil, then show the More Tab

Demo:

![](Example_GIFs/more.gif)



### Add animations to TabBarItem

ESTabBarController can customize the TabBar's style and presence, so you can customize style and animation by inhierting from ESTabBarItemContent or ESTabBarItemAnimator respectively.
ESTabBarItemAnimator decide when the animation happens by realizing the ESTabBarItemAnimatorProtocol. Of cause you can customize your own Animator, just inhiert from ESTabBarItemAnimatorProtocol.
[Example](https://github.com/eggswift/ESTabBarController/tree/master/ESTabBarControllerExample) realized some customized Animator, you can look over ExampleBackgroundAnimator, ExampleSpreadAnimator and  ExampleBounceAnimator, and get how they are realized.

Demo:

![](Example_GIFs/customize.gif)



### Comstomize click event

You can determine whether UITabBarController response to click and switch the corresponding index by setting the value of `shouldHijackHandler` if `false` indicate the current event is been hijacked. And the `hijackHandle`  realize to customize how to handle click event.
Code:

```swift
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
```

Demo:

![](Example_GIFs/hijack.gif)



### User-Guding animation

`Example` pre-set a user-guding animation to attract user to tap one of the Tabs. by inheriting ESTabBarItemContent to realize `TabBar` style.
Code：

```swift
viewController.tabBarItem = ESTabBarItem.init(content: ExampleImpliesTabBarItemContent.init(animator: ExampleBackgroundAnimator.init(special: true)))
```

Demo:

![](Example_GIFs/implies.gif)



### How to customize

If situations in the [Example](https://github.com/eggswift/ESTabBarController/tree/master/ESTabBarControllerExample) are not suitable for you, you will need to customize you own TabBar.
You can modify the UITabBarItem style as you want by inhierting from ESTabBarItemContent. Pay attention: Please set `userInteractionEnabled = false` to guarant ESTabBarViewController can handle customized TabBar click event.
To realize this by instancing ESTabBarItemAnimator.And if any object is obey `<ESTabBarItemAnimatorProtocol>` , You can customize animation as you want.
For example: ExampleBounceAnimator, you need create a method:

```swift
    func bounceAnimation(view: UIView) {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = kCAAnimationCubic
        view.layer.addAnimation(impliesAnimation, forKey: nil)
    }
```

ExampleBounceAnimator inhierted from ESTabBarItemAnimator, realize `<ESTabBarItemAnimatorProtocol>`

```swift
    public override func selectAnimation(content content: UIView, animated: Bool, completion: (() -> ())?) {
        super.selectAnimation(content: content, animated: animated, completion: completion)
        if let content = content as? ESTabBarItemContent {
            /// Add animation here
            self.bounceAnimation(content.imageView)
        }
    }

    public override func reselectAnimation(content content: UIView, animated: Bool, completion: (() -> ())?) {
        super.reselectAnimation(content: content, animated: animated, completion: completion)
        if let content = content as? ESTabBarItemContent {
            /// Add animation here
            self.bounceAnimation(content.imageView)
        }
    }

    public override func deselectAnimation(content content: UIView, animated: Bool, completion: (() -> ())?) {
        super.deselectAnimation(content: content, animated: animated, completion: completion)
    }
```

## Something unfinished

1. Use AutoLayout instead of pure code will be better to realize the Container portion UI.
2. The 'More' has some issues When the iPadx or iPhone6x Plus devices is landscape, Because of thankless of handling `itemWidth`and `itemSpacing` when doing the Containers' layout.
3. ...

## Thanks

* [animated-tab-bar](https://github.com/Ramotion/animated-tab-bar) by <http://ramotion.com>
* most images are  from<http://www.iconfont.cn>


## About

ESTabBarController is developed and maintained by [lihao](mailto:lihao_iOS@hotmail.com).If you have any doubt or questions, Welcome to open [issues](https://github.com/eggswift/ESTabBarController/issues) to discuss.

If you want contribute to ESTabBarController, Please  [Pull Request](https://github.com/eggswift/ESTabBarController/pulls)，I'll as soon as possible to deal with.

[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=https://github.com/eggswift/ESTabBarController)
[![Twitter Follow](https://img.shields.io/twitter/follow/lihao_ios.svg?style=social)](https://twitter.com/lihao_iOS)

## License

The MIT License (MIT)

Copyright (c) 2013-2015 eggswift. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

