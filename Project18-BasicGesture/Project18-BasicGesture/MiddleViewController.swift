//
//  MiddleViewController.swift
//  Project18-BasicGesture
//
//  Created by 赵瑞生 on 2017/1/9.
//  Copyright © 2017年 赵瑞生. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {
    
    @IBAction func leftSwip(_ sender: Any) {
        
        self.performSegue(withIdentifier: "middleToBottom", sender: nil)
        
        print("left")
    }

    @IBAction func rightSwip(_ sender: Any) {
        
        self.performSegue(withIdentifier: "rightToBottom", sender: nil)
        
        print("right")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
}
