//
//  LoginViewController.swift
//  LoginPageAnimation
//
//  Created by 赵瑞生 on 2016/12/26.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit
class LoginViewController: UIViewController {
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
   
    //用户名和密码输入框
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var centerAlignUsername: NSLayoutConstraint!
    
    @IBOutlet weak var centerAlignPassword: NSLayoutConstraint!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //设置输入框和按钮圆角半径
        userNameTextField.layer.cornerRadius = 5
        passwordTextField.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        let bounds = self.loginButton.bounds
        
        //点击按钮出现动画 按钮改变
        UIView.animate(withDuration: 1.0, delay: 0.00, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
            
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 80, height: bounds.size.height)
            self.loginButton.isEnabled = true
        }, completion: { finished in self.loginButton.isEnabled = true
            
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        centerAlignUsername.constant -= view.layer.bounds.width
        centerAlignPassword.constant -= view.layer.bounds.width
        loginButton.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.00, options: UIViewAnimationOptions(), animations: {
            
            self.centerAlignUsername.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.5, delay: 0.00, options: UIViewAnimationOptions(), animations: {
            self.centerAlignPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.5, delay: 0.00, options: UIViewAnimationOptions(), animations: {
            
            self.loginButton.alpha = 1
            
        }, completion: nil)
    }
    
}
