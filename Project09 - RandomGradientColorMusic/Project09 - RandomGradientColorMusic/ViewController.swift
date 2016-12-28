//
//  ViewController.swift
//  Project09 - RandomGradientColorMusic
//
//  Created by 赵瑞生 on 2016/12/28.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    //渐变色layer
    var gradientColorLayer = CAGradientLayer()
    
    var timer = Timer()
    
    

    @IBAction func playButtonDidTouch(_ sender: UIButton) {
        
        //播放音乐
        let songUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "Alan Walker - Fade", ofType: "mp3")!)
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: songUrl)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let playError as NSError {
            print(playError)
        }
        
        //启动计时器，控制每0.2s执行一次randomColor方法
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.ramdomColor), userInfo: nil, repeats: true)
        
        
        //渐变色
        gradientColorLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.4).cgColor as CGColor
        let color3 = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3).cgColor as CGColor
        let color4 = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3).cgColor as CGColor
        let color5 = UIColor(white: 0.4, alpha: 0.5).cgColor as CGColor
        
        gradientColorLayer.colors = [color1, color2, color3, color4, color5]
        gradientColorLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientColorLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientColorLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.view.layer.addSublayer(gradientColorLayer)
        
        
        
    }
    
    
    func ramdomColor() {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

