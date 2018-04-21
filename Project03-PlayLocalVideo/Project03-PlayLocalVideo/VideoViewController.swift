//
//  ViewController.swift
//  Project03-PlayLocalVideo
//
//  Created by space on 2018/4/21.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation



class VideoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

   
    @IBOutlet weak var videoTableView: UITableView!
    
    var data = [
         video(image: "1", title: "Tim Duncan", source: "Weibo - 0:30"),
         video(image: "2", title: "Tracy McGrady", source: "YouTube - 8:30"),
         video(image: "3", title: "Kobe Bryant", source: "Instgram - 9:30"),
         video(image: "4", title: "James Harden", source: "Viemo - 6:30"),
         video(image: "5", title: "Kevin Durant", source: "Facebook - 9:30"),
         video(image: "6", title: "LeBron James", source: "Twitter - 2:30")
                ]
    
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playButtonDidTouch(_ sender:AnyObject) {
        
        let path = Bundle.main.path(forResource: "1", ofType: "mp4")
        
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        
        playViewController.player = playerView
        
        self.present(playViewController, animated: true){
            self.playViewController.player?.play()
        }
    }
    
    
    
    
    /// 返回单元格数
    ///
    /// - Parameters:
    ///   - tableView: <#tableView description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("单元格+\(data.count)")
        return data.count
    }
    
    
    /// 单元格行高
    ///
    /// - Parameters:
    ///   - tableView: <#tableView description#>
    ///   - indexPath: <#indexPath description#>
    /// - Returns: <#return value description#>
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }  
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        let video = data[(indexPath as NSIndexPath).row]
        print(video)
        cell.videoScreenShot.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        
        return cell
        
    }

    

}

