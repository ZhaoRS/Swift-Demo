//
//  ViewController.swift
//  Project16-OpenDocument
//
//  Created by 赵瑞生 on 2017/1/6.
//  Copyright © 2017年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: 文档可以为很多格式，比如PDF，PPT，WORD 等等，只需修改参数即可，这里用WORD文档举例
        let url = Bundle.main.url(forResource: "Travel", withExtension: "docx")
        
        if let url = url {
            let webView = UIWebView(frame: self.view.bounds)
            let urlRequest = URLRequest(url: url)
            webView.loadRequest(urlRequest)
            self.view .addSubview(webView)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

