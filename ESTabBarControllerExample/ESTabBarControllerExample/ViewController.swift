//
//  ViewController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 2017/2/8.
//  Copyright © 2017年 Vincent Li. All rights reserved.
//

import UIKit

public class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UITabBarControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
	public let titleArray = ["Basic", "Embed", "Animation", "Irregular", "Customize click", "Remind", "Lottie"]
	public let dataArray = [
		[
			"UITabBarController default style",
			"ESTabBarController default style",
			"Mix ESTabBar and UITabBar ",
			"UITabBarController style with 'More'",
			"ESTabBarController style with 'More'",
			"Mix ESTabBar and UITabBar with 'More'",
			"UITabBarController style with no-zero default index",
			"ESTabBarController style with no-zero default index"
		],
		[
			"ESTabBarController embeds the UINavigationController style",
			"UINavigationController embeds the ESTabBarController style",
			],
		[
			"Customize the selected color style",
			"Spring animation style",
			"Background color change style",
			"With a selected effect style",
			"Suggested clicks style",
			],
		[
			"In the middle with a larger button style",
			],
		[
			"Hijack button click event",
			"Add a special reminder box",
			],
		[
			"System remind style",
			"Imitate system remind style",
			"Remind style with animation",
			"Remind style with animation(2)",
			"Customize remind style",
			],
		[
			"Lottie",
			],
		]
	
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(white: 245.0 / 255.0, alpha: 1.0)
        self.navigationItem.title = "Example"
        if tableView != nil {
            tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        }
    }
    
    // MARK: UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52.0
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 42.0
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArray[section]
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        cell?.textLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
        cell?.textLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
        cell?.textLabel?.text = "\(indexPath.section + 1).\(indexPath.row + 1) \(dataArray[indexPath.section][indexPath.row])"
        cell?.textLabel?.numberOfLines = 2
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                self.present(ExampleProvider.systemStyle(), animated: true, completion: nil)
            case 1:
                self.present(ExampleProvider.customStyle(), animated: true, completion: nil)
            case 2:
                self.present(ExampleProvider.mixtureStyle(), animated: true, completion: nil)
            case 3:
                self.present(ExampleProvider.systemMoreStyle(), animated: true, completion: nil)
            case 4:
                self.present(ExampleProvider.customMoreStyle(), animated: true, completion: nil)
            case 5:
                self.present(ExampleProvider.mixtureMoreStyle(), animated: true, completion: nil)
            case 6:
                let tabBarController = ExampleProvider.systemStyle()
                self.present(tabBarController, animated: true, completion: nil)
                tabBarController.selectedIndex = 2
            case 7:
                let tabBarController = ExampleProvider.customStyle()
                self.present(tabBarController, animated: true, completion: nil)
                tabBarController.selectedIndex = 2
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                self.present(ExampleProvider.navigationWithTabbarStyle(), animated: true, completion: nil)
            case 1:
                self.present(ExampleProvider.tabbarWithNavigationStyle(), animated: true, completion: nil)
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                self.present(ExampleProvider.customColorStyle(), animated: true, completion: nil)
            case 1:
                self.present(ExampleProvider.customBouncesStyle(), animated: true, completion: nil)
            case 2:
                self.present(ExampleProvider.customBackgroundColorStyle(implies: false), animated: true, completion: nil)
            case 3:
                self.present(ExampleProvider.customHighlightableStyle(), animated: true, completion: nil)
            case 4:
                self.present(ExampleProvider.customBackgroundColorStyle(implies: true), animated: true, completion: nil)
            default:
                break
            }
        case 3:
            switch indexPath.row {
            case 0:
                self.present(ExampleProvider.customIrregularityStyle(delegate: nil), animated: true, completion: nil)
            default:
                break
            }
        case 4:
            switch indexPath.row {
            case 0:
                self.present(ExampleProvider.customIrregularityStyle(delegate: self), animated: true, completion: nil)
            case 1:
                self.present(ExampleProvider.customTipsStyle(delegate: self), animated: true, completion: nil)
            default:
                break
            }
        case 5:
            switch indexPath.row {
            case 0:
                self.present(ExampleProvider.systemRemindStyle(), animated: true, completion: nil)
            case 1:
                self.present(ExampleProvider.customRemindStyle(), animated: true, completion: nil)
            case 2:
                self.present(ExampleProvider.customAnimateRemindStyle(implies: false), animated: true, completion: nil)
            case 3:
                self.present(ExampleProvider.customAnimateRemindStyle2(implies: false), animated: true, completion: nil)
            case 4:
                self.present(ExampleProvider.customAnimateRemindStyle3(implies: false), animated: true, completion: nil)
            default:
                break
            }
        case 6:
            switch indexPath.row {
            case 0:
                self.present(ExampleProvider.lottieSytle(), animated: true, completion: nil)
            default:
                break
            }
        default:
            break
        }
        
    }

}


