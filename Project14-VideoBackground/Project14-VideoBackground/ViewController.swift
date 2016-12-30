//
//  ViewController.swift
//  Project14-VideoBackground
//
//  Created by 赵瑞生 on 2016/12/29.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupVideoBackground()
    }
    
    
    //MARK：配置
    func setupVideoBackground() {
        let videoPath = Bundle.main.path(forResource: "spotify", ofType: "mp4")
        let videoUrl = URL(fileURLWithPath: videoPath!)
        
        
        videoFrame = view.frame
        fillMode = ScalingMode.resizeAspectFill
        alwaysRepeat = true
        sound = false
        startTime = 2.0
        alpha = 0.8
        
        contentURL = videoUrl
        view.isUserInteractionEnabled = false
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

