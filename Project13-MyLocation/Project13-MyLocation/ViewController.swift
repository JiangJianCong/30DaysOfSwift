//
//  ViewController.swift
//  Project13-MyLocation
//
//  Created by space on 2018/5/6.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager : CLLocationManager!
    
    
    
    /// 按钮点击操作
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func showMyLocationDidTouch(_ sender: AnyObject) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        //keypoint  自动暂停位置更新
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 错误时更新label
    ///
    /// - Parameters:
    ///   - manager: <#manager description#>
    ///   - error: <#error description#>
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLabel.text = "Error : " + error.localizedDescription
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler:  { (placeMarks, error) -> Void in
            
            if (error != nil) {
                self.locationLabel.text = "Reverse geocoder failed with error" + (error!.localizedDescription)
                return
            }
            
            if placeMarks!.count > 0 {
                let PM = placeMarks![0]
                self.showLocationInfo(PM)
            } else {
                self.locationLabel.text = "Problem with the data received from geocoder"
            }
        })
    }
    
    
    /// 显示位置
    ///
    /// - Parameter placemark: <#placemark description#>
    func showLocationInfo(_ placemark : CLPlacemark?) {
        
        if let containsPlacemark = placemark {
            
            locationManager.startUpdatingLocation()
            
            let locatity = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.locationLabel.text = locatity! + " " + postalCode! + " " + administrativeArea! + " " + country!
            
        }
        
    }
    

}

