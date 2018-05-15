//
//  MainViewController.swift
//  Project02-CustomFonts
//
//  Created by space on 2018/4/20.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class MainViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var data = ["space","使用UITableView","使用UITableViewDelegate","1234567","abcdef","##$%^^&&","910455361@qq.com",
                    "151250070","xxxx@qq.com"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Gaspar Regular"]
    
    var fontRowIndex = 0
    
    @IBOutlet weak var changeFontButton: UIButton!
    @IBOutlet weak var fontTableView: UITableView!
    @IBAction func changeFontDidTouch (_ sender: AnyObject) {
        
        fontRowIndex = (fontRowIndex + 1) % 4
        print(fontNames[fontRowIndex])
        fontTableView.reloadData()
    }
    
    
    /// 这里是返回tableView的行数
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - section:
    /// - Returns: tableView的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    /// 先添加tableview绑定到ViewController里，然后在ViewDidload里调用网络链接获取到网络数据，然后保存到一个类数组里，然后再加载完数据后调用绑定的
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - indexPath:
    /// - Returns:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ViewTableCell
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.font = UIFont(name: fontNames[fontRowIndex], size: 20)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fontTableView.dataSource = self
        changeFontButton.layer.cornerRadius = 60
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
