//
//  WebViewController.swift
//  ESPullToRefreshExample
//
//  Created by lihao on 16/5/6.
//  Copyright © 2016年 egg swift. All rights reserved.
//

import UIKit

public class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var dismissButton: UIButton!
    
	public class func instanceFromStoryBoard() -> WebViewController {
		return UIStoryboard(name: "WebView", bundle: nil).instantiateInitialViewController() as! WebViewController
	}
    @IBOutlet weak var webView: UIWebView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.title = "https://github.com/eggswift"
        self.webView.delegate = self
        self.webView.loadRequest(URLRequest(url: URL(string: "https://github.com/eggswift")!))
        self.webView.scrollView.bounces = true
        self.webView.scrollView.alwaysBounceVertical = true
        
        self.dismissButton.layer.borderWidth = 2
        self.dismissButton.layer.borderColor = UIColor.lightGray.cgColor
        self.dismissButton.layer.cornerRadius = 12
    }

    @IBAction func dismissAction(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
