//
//  ViewController.swift
//  LoginPageAnimation
//
//  Created by 赵瑞生 on 2016/12/26.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //设置按钮半径圆角
        signUpButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

