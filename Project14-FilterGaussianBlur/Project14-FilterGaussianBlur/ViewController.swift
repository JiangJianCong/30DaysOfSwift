//
//  ViewController.swift
//  Project14-FilterGaussianBlur
//
//  Created by space on 2018/5/7.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var image : UIImage = UIImage(named: "kiwi")!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = self.image
        label.text = "111"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 更换模糊度
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func changeValue(_ sender: AnyObject) {
        let slider = sender as! UISlider
        let value : Float = slider.value
        
        self.filterGaussianBlur(value)
    }
    
    
    /// 更换模糊度
    ///
    /// - Parameter value: <#value description#>
    func filterGaussianBlur(_ value : Float) {
        print(value)
        
        let context = CIContext(options: nil)
        let cImage = CIImage(cgImage: self.image.cgImage!)

        let gaussianBlur = CIFilter(name: "CIGaussianBlur")
        gaussianBlur?.setValue(cImage, forKey: "inputImage")

        let text = String(format: "高斯模糊 Radius : %.2f", value * 10)
        self.label.text = text

        gaussianBlur?.setValue(value, forKey: "inputRadius")
        let result = gaussianBlur?.value(forKey: "outputImage") as! CIImage

        let imageRef = context.createCGImage(result, from: CGRect(x: 0, y: 0, width: self.imageView.image!.size.width, height: self.imageView.image!.size.height))

        let image = UIImage(cgImage: imageRef!)
        self.imageView.image = image

        
        
    }

}















