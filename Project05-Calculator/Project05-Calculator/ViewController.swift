//
//  ViewController.swift
//  Project05-Calculator
//
//  Created by space on 2018/4/22.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    
    
    @IBAction func appendDigit(_ sender: AnyObject) {
        let digit = sender.currentTitle!!
        print("数字:\(digit)")
        display.text = digit
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display.layer.borderWidth = 1;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

