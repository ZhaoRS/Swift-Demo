//
//  ViewController.swift
//  Project17-SetDateAndTime
//
//  Created by 赵瑞生 on 2017/1/6.
//  Copyright © 2017年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var date = ""
    
    override func viewWillAppear(_ animated: Bool) {
        print(date)
        dateLabel.text = date
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationVC = segue.destination as! UINavigationController
        let setDateVC = navigationVC.viewControllers.first as! SetDateController
        
        //传值
        setDateVC.newDate = ({string in self.date = string})
    }
    
    
}

