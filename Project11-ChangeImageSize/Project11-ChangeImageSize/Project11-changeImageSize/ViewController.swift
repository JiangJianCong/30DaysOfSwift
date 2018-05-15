//
//  ViewController.swift
//  Project11-changeImageSize
//
//  Created by space on 2018/5/5.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    var imageView : UIImageView!
    var scrollView : UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //多指模式
        self.view.isMultipleTouchEnabled = true
        
        imageView = UIImageView(image: UIImage(named: "mavenPic"))
        
        setUpScrollView()
        scrollView.delegate = self
        
        setZoomScale(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    /// 设置scrollView 属性，并且设置到view上
    fileprivate func setUpScrollView(){
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
    }
    
    
    /// 缩放倍数！！重点
    ///
    /// - Parameter scrollViewSize: <#scrollViewSize description#>
    fileprivate func setZoomScale(_ scrollViewSize: CGSize ) {

        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minmumScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minmumScale
        scrollView.maximumZoomScale = 2.1
        
    }
    
    
    /// 重定位图片
    fileprivate func recenterImage() {
        var horizonSpace = CGFloat()
        var verticalSpace = CGFloat()
        
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        
        if imageViewSize.width < scrollViewSize.width {
            horizonSpace = (scrollViewSize.width - imageViewSize.width) / 2.0
            
        }else {
            horizonSpace = 0.0
        }
        
        if imageViewSize.height < scrollViewSize.height {
            verticalSpace = (scrollViewSize.height - imageViewSize.height) / 2.0
        } else {
            verticalSpace = 0.0
        }
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizonSpace, verticalSpace, horizonSpace)
        
    }
    
    func viewForZooming(in scrollView:UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidZoom(_ scrollView:UIScrollView) {
        self.recenterImage()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

