//
//  ViewController.swift
//  Project12-MyLocation
//
//  Created by 赵瑞生 on 2016/12/29.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    var locationManager: CLLocationManager!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return UIStatusBarStyle.lightContent
    }
    
    
    

    //MARK:点击按钮，显示定位
    @IBAction func showMyLocation(_ sender: Any) {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        //MARK:属性 自动暂停位置更新
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    @IBOutlet weak var LocationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.LocationLabel.text = "Error while updating location" + error.localizedDescription
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        CLGeocoder().reverseGeocodeLocation(manager.location!,  completionHandler: { (placeMarks, error) -> Void in
            
            if(error != nil) {
            
                self.LocationLabel.text = "Reverse geocoder failed with error" + (error!.localizedDescription)
                return
            }
            
            if placeMarks!.count > 0 {
            
                let PM = placeMarks![0]
                self.showMyLocation(PM)
            } else {
                self.LocationLabel.text = "Problem with the data received from geocoder"
            }
        
        
        })
    }
    
    //MARK: 显示位置
    func showLocationInfo(_ placemark: CLPlacemark?) {
        if let containPlacemark = placemark {
            locationManager.startUpdatingLocation()
            
            let locality = (containPlacemark.locality != nil) ? containPlacemark.locality : ""
            
            let postalCode = (containPlacemark.postalCode != nil) ? containPlacemark.postalCode : ""
            let administrativeArea = (containPlacemark.administrativeArea != nil) ? containPlacemark.administrativeArea : ""
            let contriry = (containPlacemark.country != nil) ? containPlacemark.country : ""
            
            self.LocationLabel.text = locality! + " " + postalCode! + " " + administrativeArea! + " " + contriry!
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

