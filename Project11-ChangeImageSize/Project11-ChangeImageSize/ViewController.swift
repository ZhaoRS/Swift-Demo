//
//  ViewController.swift
//  Project11-ChangeImageSize
//
//  Created by 赵瑞生 on 2016/12/29.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:多指触摸操作
        self.view.isMultipleTouchEnabled = true
        
        imageView = UIImageView(image: UIImage(named: "JH13"))
        
        setUpScrollView()
        
        scrollView.delegate = self
        
        setZoomScale(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        recenterIamge()
        
        
        
    }
    
    //MARK：设置scrollview属性，并添加到view
    fileprivate func setUpScrollView() {
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    //MARK: 设置缩放倍数
    fileprivate func setZoomScale(_ scrollViewSize: CGSize) {
    
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minimumScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimumScale
        scrollView.maximumZoomScale = 2.5
    }
    
    fileprivate func  recenterIamge() {
        
        var horizongSapce = CGFloat()
        var verticalSpace = CGFloat()
        
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        
        if imageViewSize.width < scrollViewSize.width {
            horizongSapce = (scrollViewSize.width - imageViewSize.width) / 2.0
        } else {
            horizongSapce = 0.0
        }
        
        if imageViewSize.height < scrollViewSize.height {
            verticalSpace = (scrollViewSize.height - scrollViewSize.height) / 2.0
        } else {
            verticalSpace = 0.0
        }
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizongSapce, verticalSpace, horizongSapce)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.recenterIamge()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

