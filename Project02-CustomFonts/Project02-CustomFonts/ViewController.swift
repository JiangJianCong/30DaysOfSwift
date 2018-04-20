//
//  ViewController.swift
//  Project02-CustomFonts
//
//  Created by space on 2018/4/20.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var data = ["space","使用UITableView","使用UITableViewDelegate","1234567","abcdef","##$$%%^^&&","910455361@qq.com"
                "151250070","xxxx@qq.com"]
    
     var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Zapfino", "Gaspar Regular"]
    
    @IBOutlet weak var changeFontButton : UIButton!
    @IBOutlet weak var fontTableView : UITableView!
    @IBAction func changeFontDidTouch (_sender:AnyObject) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

