![ESTabBarController](logo.png)

[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-orange.svg)](#swift-package-manager)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/cocoapods/v/ESTabBarController-swift.svg)](http://cocoapods.org/pods/ESTabBarController-swift)
[![Swift v5](https://img.shields.io/badge/Swift-5-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Twitter](https://img.shields.io/badge/Twitter-@lihao_iOS-blue.svg?style=flat)](https://twitter.com/lihao_iOS)
[![Twitter](https://img.shields.io/badge/Weibo-@李昊_____-orange.svg?style=flat)](http://weibo.com/5120522686/profile?rightmod=1&wvr=6&mod=personinfo&is_all=1)
[![Chat Gitter.im](https://badges.gitter.im/ESTabBarController/Lobby.svg)](https://gitter.im/ESTabBarController/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

### [中文介绍](README_CN.md)

**ESTabBarController** is a highly customizable TabBarController component, which is inherited from UITabBarController.

### Why?

In real-world development, we may encounter the situation that customizing the UITabBar. For instance: change font style, add animation, use bigger item. However it's hard to do with UITabBarItem.

**With ESTabBarController, You can easily achieve these！**

-| Feature |Description
-------------|-------------|-------------
1| Default style | You can get system-like style by initializing the TabBar with ESTabBarController directly.  </p> UITabBarController style: </p> ![System native style](Resources/SystemStyle.png) </p> ESTabBarController default style: </p> ![ES system-like style](Resources/CustomStyle.png)
2| Default style with "More" item | If the items are more than the maximum number of displays, there will be a "More" item. </p> UITabBarController with "More": </p> ![enter image description here](Resources/SystemMoreStyle.png) </p> ESTabBarController with "More": </p> ![enter image description here](Resources/CustomMoreStyle.png)
3| Mix UITabBarItem and ESTabBarItem | You can set any item as you want, including UITabBarItem and ESTabBarItem. </p> ESTabBar and UITabBar mixed style: </p> ![enter image description here](Resources/MixtureStyle.png) </p> ESTabBar and UITabBar mixed style with "More": </p> ![enter image description here](Resources/MixtureMoreStyle.png)
4| UIKit attributes | ESTabBarController is compatible with UITabBarController, UITabBar and UITabBarItem's most API attributes. You can migrate to ESTabBarController without any modification of the origin code.  </p> Compatible with UITabBarController's `selectedIndex`: </p> ![enter image description here](Resources/SelectIndexCode.png)
5| Any nesting with UINavigationController | Developing with`UITabBarController`, there are two common ways to handle layers: </p> First : </p> ├── UITabBarController </p> └──── UINavigationController </p> └────── UIViewController </p> └──────── SubviewControllers </p> Second : </p> ├── UINavigationController </p> └──── UITabBarController </p> └────── UIViewController </p> └──────── SubviewControllers </p> In the first case, need to set `hidesBottomBarWhenPushed = true` when pushing subViews. The second is not. </p> In ESTabBarController, add Container views to UITabBar to be compatible with these two ways。
6| Customizable style | With ESTabBarController, you can：</p> 1. Customize selected item's color and style: </p> ![enter image description here](Resources/CustomSelectStyleGif.gif) </p> 2. Add selecting animation:  </p> ![enter image description here](Resources/CustomSelectAnimateGif.gif) </p> 3. Customize item's background color: </p> ![enter image description here](Resources/CustomBackgroundGif.gif) </p> 4. Add highlight animation: </p> ![enter image description here](Resources/CustomHighlightGif.gif) </p> 5. Add animation to prompt users: </p> ![enter image description here](Resources/CustomImpliesGif.gif) </p> 6. And much more ... </p>
7| Customizable item's size </p> Customizable click event | You can easily customize item's size using ESTabBarController. </p> **When the button's frame is larger than TabBar, through the use of HitTest to achieve making outer TabBar area click valid.** </p> In addition, ESTabBarController can customize click event, and through a block to callback super-layer to handle. </p> With big item in the middle of TabBar: </p> ![enter image description here](Resources/CustomStyle2.png) </p> With a special hint style: </p> ![enter image description here](Resources/CustomStyle3.png) </p> Customize click event: </p> ![enter image description here](Resources/CustomHitGif.gif)
8| Default notification style |  You can get system-like notification style by initializing the TabBar with ESTabBarController directly. </p> UITabBarController notification style: </p> ![enter image description here](Resources/SystemNotificationStyle.png) </p> ESTabBarController system-like notification style: </p> ![enter image description here](Resources/CustomNotificationStyle.png)
9| Customizable notification style | With ESTabBarController, you can：</p> 1. Customize notification animation: </p> ![enter image description here](Resources/CustomNofticationGif.gif) </p> ![enter image description here](Resources/CustomNofticationGif2.gif) </p> 2. Customize prompt style: </p> ![enter image description here](Resources/CustomNofticationGif3.gif) </p> 3. And much more ... </p>
10| Lottie | Through customizing ContentView, you are able to add Lottie's LAAnimationView to Item(s) </p> ![enter image description here](Resources/LottieGif.gif)

## Requirements

* Xcode 8 or later
* iOS 8.0 or later
* ARC
* Swift 5 or later

## Demo

You can download and build ESTabBarControllerExample project, and you will find more examples to use ESTabBarController, and also more examples to customize UITabBar。

## Usage

### CocoaPods

``` ruby
pod "ESTabBarController-swift"
```

### Carthage

```ruby
github "eggswift/ESTabBarController"
```

### Manually

``` ruby
git clone https://github.com/eggswift/ESTabBarController.git
open ESTabBarController
```

## TODO

1. The Containers' layout is purely based on code，using Autolayout will be better.
2. When there is "More", if edit it will occurs problem.
3. Partial UITabBarItem attributes are not bridge to ESTabBarItem.
4. ~~The picture of 'More' item in ESTabBarItemMoreContentView is not set into framework, plan to convert it to CGBitmap.~~


## Acknowledgement

* [animated-tab-bar](https://github.com/Ramotion/animated-tab-bar) by <http://ramotion.com> 
* Partial pictures in Example are from <http://www.iconfont.cn>


## About

ESTabBarController is developed and maintained by [Vincent Li](mailto:lihao_iOS@hotmail.com). If you have any questions or issues in using ESTabBarController, welcome to [issue](https://github.com/eggswift/ESTabBarController/issues). </br>
If you want to contribute to ESTabBarController, Please submit [Pull Request](https://github.com/eggswift/ESTabBarController/pulls), I will deal with it as soon as possible. </br>

[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=https://github.com/eggswift/ESTabBarController)
[![Twitter Follow](https://img.shields.io/twitter/follow/lihao_ios.svg?style=social)](https://twitter.com/lihao_iOS)


## License

The MIT License (MIT)

Copyright (c) 2013-2016 eggswift. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

