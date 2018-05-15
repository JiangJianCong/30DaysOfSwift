//
//  ViewController.swift
//  Project02-CustomFonts
//
//  Created by space on 2018/4/20.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
  
    

    
    var data = ["space","使用UITableView","使用UITableViewDelegate","1234567","abcdef","##$%^^&&","910455361@qq.com",
                "151250070","xxxx@qq.com"]
    
     var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Gaspar Regular"]
    
    var fontRowIndex = 0
    
    @IBOutlet weak var changeFontButton : UIButton!
    @IBOutlet weak var fontTableView : UITableView!
    @IBAction func changeFontDidTouch (_sender:AnyObject) {
        
        fontRowIndex = (fontRowIndex + 1 ) % 4
        print(fontNames[fontRowIndex])
        fontTableView.reloadData();
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontTableView.dataSource = self
        fontTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        changeFontButton.layer.cornerRadius = 50
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 35
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)
        let text = data[indexPath.row]

        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.white
//        cell.textLabel?.font = UIFont(name: self.fontNames[fontRowIndex], size: 16)

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    
}

