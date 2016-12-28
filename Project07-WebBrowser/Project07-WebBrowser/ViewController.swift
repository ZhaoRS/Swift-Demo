//
//  ViewController.swift
//  Project07-WebBrowser
//
//  Created by 赵瑞生 on 2016/12/28.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        webView.delegate = self
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //加载请求
        loadUrl(textField.text!, web: webView)
        //接触键盘的响应
        textField.resignFirstResponder()
        return true
    }
    
    //加载请求的方法
    func loadUrl(_ url: String, web: UIWebView) {
        //载入输入的请求
        let aUrl = URL(string:("https://" + url))
//        let aUrl = URL(string: "https://www.baidu.com")
        let urlRequest = URLRequest(url: aUrl!)
        web.loadRequest(urlRequest)
    }
    
    
    //z加载页面开始
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadingView.isHidden = false
        //轮圈开始转动
        loadingView.startAnimating()
        
        //状态栏的网络请求开始活动
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingView.isHidden = true
        loadingView.stopAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

