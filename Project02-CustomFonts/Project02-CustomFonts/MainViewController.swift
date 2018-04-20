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
    
    @IBOutlet weak var changeFontButton: UIButton!
    @IBOutlet weak var fontTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ViewTableCell
        
        let text = data[indexPath.row]
        print(text)
        cell.textLabel?.text = text
//        cell.textLabel?.textColor = UIColor.black
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fontTableView.dataSource = self
        changeFontButton.layer.cornerRadius = 50

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
