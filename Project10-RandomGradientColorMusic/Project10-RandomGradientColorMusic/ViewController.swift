//
//  ViewController.swift
//  Project10-RandomGradientColorMusic
//
//  Created by space on 2018/5/4.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gradientColorLayer = CAGradientLayer()
    
    var timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
    /// 点击的监听
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func playButtonDidTouch(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
        
        //处理渐变
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
    
    
    
    /// 随机颜色
    @objc func randomColor(){
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

