//
//  WebViewController.swift
//  ESPullToRefreshExample
//
//  Created by lihao on 16/5/6.
//  Copyright © 2016年 egg swift. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "https://github.com/eggswift"
        self.webView.delegate = self
        self.webView.loadRequest(NSURLRequest.init(URL: NSURL.init(string: "https://github.com/eggswift")!))
        self.webView.scrollView.bounces = true
        self.webView.scrollView.alwaysBounceVertical = true
    }

}
