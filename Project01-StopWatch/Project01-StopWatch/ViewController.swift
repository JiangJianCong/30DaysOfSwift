//
//  ViewController.swift
//  Project01-StopWatch
//
//  Created by space on 2018/4/20.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playBtn : UIButton!
    @IBOutlet weak var pauseBtn : UIButton!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeLabel.text = String(counter)
        super.viewDidLoad()
    }
    
    /// 开始按钮
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func playButtonDidTouch(sender: AnyObject) {
        if isPlaying {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
        
    }
    
    
    /// 暂停按钮
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func pauseButtonDidTouch(sender: AnyObject) {
        
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
        
    }
    
    /// 重置按钮
    ///
    /// - Parameter sender:
    @IBAction func resetButtonDidTouch(sender: AnyObject){
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
    }
    
    
    
    
    /// 更新timer
    @objc func updateTimer(){
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

