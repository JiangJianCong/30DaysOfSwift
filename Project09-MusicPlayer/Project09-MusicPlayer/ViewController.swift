//
//  ViewController.swift
//  Project09-MusicPlayer
//
//  Created by space on 2018/5/3.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var aritistabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var albumLabel: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    var isPlaying: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //模糊背景
        bgImage.image = UIImage(named: "COA")
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        bgImage.addSubview(blurEffectView)
        
        albumLabel.image = UIImage(named: "fun")
        
        songLabel.textColor = UIColor.white
        songLabel.text = "All alone"
        aritistabel.textColor = UIColor.white
        aritistabel.text = "FUN."
        
        playButton.setImage(UIImage(named: "Pause"), for: UIControlState())
        
        //play the music
        playMusic()
        
        playButton.addTarget(self, action: #selector(ViewController.playOrPause), for: UIControlEvents.touchUpInside)
        
        
    }

    
    /// 播放音乐
    func playMusic(){
        let songUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "song", ofType: "mp3")!)
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: songUrl)
            
            //循环播放
            audioPlayer.numberOfLoops = -1;
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
        }catch let playError as NSError {
            print(playError)
        }
    }
    
    
    /// 继续播放或者暂停
    @objc func playOrPause() {
        if isPlaying {
            audioPlayer.play()
            playButton.setImage(UIImage(named: "start"), for: UIControlState())
            isPlaying = false
        } else {
            audioPlayer.stop()
            playButton.setImage(UIImage(named: "Pause"), for: UIControlState())
            isPlaying = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

