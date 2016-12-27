//
//  ViewController.swift
//  StopWatch
//
//  Created by 赵瑞生 on 2016/12/26.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //显示时间
        timeLabel.text = String(counter)
 
    }
    
    //开始按钮点击
    @IBAction func palyButtonDidTouch(_ sender: UIButton) {
        if isPlaying {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
        
    }
    
    //暂停
    @IBAction func pauseButtonDidTouch(_ sender: UIButton) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        //计时器停止
        timer.invalidate()
        isPlaying = false
        
    }

    @IBAction func resetButtonDidTouch(_ sender: UIButton) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
        
        
    }
    
    
    
    func updateTimer() {
    
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

