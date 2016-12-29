//
//  ViewController.swift
//  Project13-FilterGaussianBlur
//
//  Created by 赵瑞生 on 2016/12/29.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bgImageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var horizontalSlider: UISlider!
    
    var image: UIImage = UIImage(named: "audi")!
    
    @IBAction func changeValue(_ sender: Any) {
        
        
        let slider = sender as! UISlider
        let value: Float = slider.value
        
        
        self.filterGaussianBlur(value)
    }
    
    //MARK:高斯模糊滤镜效果
    func filterGaussianBlur(_ value: Float)  {
        
        let context = CIContext(options: nil)
        let cImage = CIImage(cgImage: self.image.cgImage!)
        
        let guassianBlur = CIFilter(name: "CIGaussianBlur")
        guassianBlur?.setValue(cImage, forKey: "inputImage")
        
        let text = String(format: "高斯模糊 Radius:%.2f", value * 10)
        self.titleLabel.text = text
        
        guassianBlur!.setValue(value, forKey: "inputRadius")
        let result = guassianBlur?.value(forKey: "outputImage") as! CIImage
        
        let imageRef = context.createCGImage(result, from: CGRect(x: 0, y: 0, width: self.bgImageView.image!.size.width, height: self.bgImageView.image!.size.height))
        let image = UIImage(cgImage: imageRef!)
        
        self.bgImageView.image = image
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImageView.image = self.image
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

