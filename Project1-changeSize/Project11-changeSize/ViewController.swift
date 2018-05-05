//
//  ViewController.swift
//  Project1-changeSize
//
//  Created by space on 2018/5/5.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView : UIImageView!
    var scrollview : UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //多指模式
        self.view.isMultipleTouchEnabled = true
        
        imageView = UIImageView(image: UIImage(named: "kiwi"))
        
        setUpScrollView()
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    /// 设置scrollView 属性，并且设置到view上
    fileprivate func setUpScrollView(){
        scrollview = UIScrollView(frame: view.bounds)
        scrollview.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        scrollview.backgroundColor = UIColor.clear
        scrollview.contentSize = imageView.bounds.size
        
        scrollview.addSubview(imageView)
        view.addSubview(scrollview)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

