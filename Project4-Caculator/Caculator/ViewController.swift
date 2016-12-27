//
//  ViewController.swift
//  Caculator
//
//  Created by 赵瑞生 on 2016/12/26.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var logic: CalculatorLogic!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        mainLabel.text = logic.updateMainLabelStringByNumberTag(sender.tag, withMainLabelString: mainLabel.text!)
    }
   
    
    @IBAction func clearPressed(_ sender: UIButton) {
        mainLabel.text = "0"
        logic.clean()
    }
    
    
    @IBAction func decimalPress(_ sender: UIButton) {
        if logic.doesStringContainDecimal(mainLabel.text!)  == false {
            let string = mainLabel.text! + "."
            mainLabel.text = string
        }
    }
    
    
    @IBAction func operandPressed(_ sender: UIButton) {
        mainLabel.text = logic.calculatorByTag(sender.tag, withMainLabelString: mainLabel.text!)
        
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
        mainLabel.text = logic.calculatorByTag(sender.tag, withMainLabelString: mainLabel.text!)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "0"
        logic = CalculatorLogic()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        logic = nil
    }

    
    

}

