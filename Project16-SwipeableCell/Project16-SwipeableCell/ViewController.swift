//
//  ViewController.swift
//  Project16-SwipeableCell
//
//  Created by space on 2018/5/8.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let data = [
        player(image:"1",name: "1"),
        player(image:"2",name: "2"),
        player(image:"3",name: "3"),
        player(image:"4",name: "4"),
        player(image:"5",name: "5"),
        player(image:"6",name: "6")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    

    
    /// 字节数
    ///
    /// - Parameter tableView: <#tableView description#>
    /// - Returns: <#return value description#>
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    
    /// 1字节的行数
    ///
    /// - Parameters:
    ///   - tableView: <#tableView description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(data.count)
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell") as! PlayerCell
        
        
        
        let currentPlayer = data[indexPath.row]
        
        
        
        cell.playerImage.image = UIImage(named: currentPlayer.image)
        cell.playerName.text = currentPlayer.name
        
        print(indexPath.row)
        
        return cell
        
        
    }
    //MARK: 操作
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let like = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "喜欢") { action, index in
            print("You have tapped like button")
            
        }
        like.backgroundColor = UIColor.red
        
        let chat = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "聊聊") { action, index in
            print("You have tapped chat button")
        }
        chat.backgroundColor = UIColor.blue
        
        let share = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "分享") { (action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            
            let activityItem = self.data[indexPath.row]
            
            let activityViewController = UIActivityViewController(activityItems: [activityItem.image as String], applicationActivities: nil)
            
            self.present(activityViewController, animated: true, completion: nil)
            
        }
        share.backgroundColor = UIColor.brown
        
        return [share, chat, like]
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    

}

