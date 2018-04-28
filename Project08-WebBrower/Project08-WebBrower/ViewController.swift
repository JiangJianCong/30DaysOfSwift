//
//  ViewController.swift
//  Project08-WebBrower
//
//  Created by space on 2018/4/28.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate, UITextFieldDelegate{



    
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var webView1: UIWebView!
    
    
    
    
    /// 加载网页的方法
    ///
    /// - Parameters:
    ///   - url: <#url description#>
    ///   - web: <#web description#>
    func loadUrl(_ url:String , web:UIWebView ) {
        
        let url = URL(string: url)
        let urlRequest = URLRequest(url: url!)
        print(urlRequest)
        web.loadRequest(urlRequest)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loadUrl(textField.text!, web: webView1)
        textField.resignFirstResponder()
        return true
        
    }
    
    
    /// 开始加载
    ///
    /// - Parameter webView: <#webView description#>
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    
    /// 结束加载
    ///
    /// - Parameter webView: <#webView description#>
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.delegate = self
        webView1.delegate = self
    }
    
    
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

