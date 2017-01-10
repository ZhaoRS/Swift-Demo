//
//  TopViewController.swift
//  Project18-BasicGesture
//
//  Created by 赵瑞生 on 2017/1/9.
//  Copyright © 2017年 赵瑞生. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    @IBAction func topSwip(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "topToMiddle", sender: .none)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
}
