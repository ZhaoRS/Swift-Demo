//
//  ViewController.swift
//  Project 06 - EmojiMachine
//
//  Created by 赵瑞生 on 2016/12/27.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds: CGRect = CGRect.zero
    
    @IBOutlet weak var emojiPickerView: UIPickerView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var goButton: UIButton!
    
    @IBAction func goButtonTouch(_ sender: UIButton) {
        
        //随机
        emojiPickerView.selectRow(Int(arc4random() % 9 + 3), inComponent: 0, animated: true)
        emojiPickerView.selectRow(Int(arc4random() % 9 + 3), inComponent: 1, animated: true)
        emojiPickerView.selectRow(Int(arc4random() % 9 + 3), inComponent: 2, animated: true)
        
        //判断三个轮盘结果是否相同
        if dataArray1[emojiPickerView.selectedRow(inComponent: 0)] ==
            dataArray2[emojiPickerView.selectedRow(inComponent: 1)] &&
            dataArray2[emojiPickerView.selectedRow(inComponent: 1)] ==
            dataArray3[emojiPickerView.selectedRow(inComponent: 2)] &&
            dataArray3[emojiPickerView.selectedRow(inComponent: 2)] ==
            dataArray1[emojiPickerView.selectedRow(inComponent: 0)]{
            resultLabel.text = "SUCCESS"

        } else {
            resultLabel.text = "Try Again"
        }
        
        
        //点击按钮动画
        UIView.animate(withDuration: 0.5, delay: 0.00, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: {
            self.goButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width + 20, height: self.bounds.size.height)
            
        }, completion: { (complete: Bool) in
            
            UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions(), animations: {
                
                self.goButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
                
            }, completion: nil)
        
        
        })
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //key
        bounds = goButton.bounds
        imageArray = ["🐶", "🐼", "🐵", "🐸", "🐮", "🐲", "🐯", "🐰", "🐹", "🐭"]
        
        for _ in 0..<100 {
            dataArray1.append((Int)(arc4random() % 10))
            dataArray2.append((Int)(arc4random() % 10))
            dataArray3.append((Int)(arc4random() % 10))
        }
        
        resultLabel.text = ""
        
        //设置pickerView的代理
        emojiPickerView.dataSource = self
        emojiPickerView.delegate = self
        
        goButton.layer.cornerRadius = 5

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        goButton.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
        
            self.goButton.alpha = 1
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        } else if component == 1 {
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        } else {
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        //emoji大小和对其方式
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = .center
        
        return pickerLabel
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}

