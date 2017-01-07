//
//  SetDateController.swift
//  Project17-SetDateAndTime
//
//  Created by 赵瑞生 on 2017/1/6.
//  Copyright © 2017年 赵瑞生. All rights reserved.
//

import UIKit

class SetDateController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    var formatter = DateFormatter()
    
    //传值函数
    var newDate: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //获取当前时间
    func showTime() {
    
        let date = Date()
        let timeFormatter = DateFormatter()
        
        timeFormatter.dateFormat = "yyy-MM-dd' at 'HH:mm"
        currentTimeLabel.text = timeFormatter.string(from: date) as String
    }
    

    @IBAction func backButtonAction(_ sender: Any) {
        
        
        
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        
        formatter.dateStyle = .medium
        let dateString = formatter.string(from: datePicker.date)
        
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        
        let timeString = formatter.string(from: timePicker.date)
        
        let resultString = dateString + " " + timeString
        
        self.newDate!(resultString)
        
        self.navigationController?.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    

}
