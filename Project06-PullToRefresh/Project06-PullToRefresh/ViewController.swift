//
//  ViewController.swift
//  Project06-PullToRefresh
//
//  Created by space on 2018/4/23.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{

    
    let cellIdentifer = "NewCellIdentifer"
    
    let originEmoji = ["😏😏😏", "😂😂😂", "😘😘😘", "👀👀👀", "👊🏻👊🏻👊🏻", "👍🏼👍🏼👍🏼", "🐔🐔🐔"]
    let newEmoji = ["🌚🌚🌚", "😱😱😱", "😳😳😳", "😄😄😄", "😂😂😂", "😘😘😘", "👀👀👀", "🙊🙊🙊", "🐶🐶🐶"]
    var emojiData = [String]()
    var tableViewController = UITableViewController(style: .plain)
    
    var refreshControl = UIRefreshControl()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        emojiData = originEmoji
        let emojiTableview = tableViewController.tableView
        
        emojiTableview?.backgroundColor = UIColor.gray
        emojiTableview?.delegate? = self
        emojiTableview?.dataSource? = self
        
        emojiTableview?.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        
        tableViewController.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(ViewController.didRoadEmoji), for: .valueChanged)
        
        self.refreshControl.backgroundColor = UIColor.black
        
//        let attributes = [NSForegroundColorAttributeName: UIColor.white]
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "最近一次加载\(Date())",attributes:attributes)
        self.refreshControl.tintColor = UIColor.blue
        
        emojiTableview?.rowHeight = UITableViewAutomaticDimension
        emojiTableview?.estimatedRowHeight = 80.0
        emojiTableview?.tableFooterView = UIView(frame: CGRect.zero)
        emojiTableview?.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.view.addSubview(emojiTableview!)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)! as UITableViewCell
        
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.textLabel?.font = UIFont(name: "systemFont", size: 50)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    @objc func didRoadEmoji(){
        self.emojiData = newEmoji + originEmoji
        self.tableViewController.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

