//
//  VideoCell.swift
//  Project03-PlayLocalVideo
//
//  Created by space on 2018/4/21.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit


struct video {
    let image : String
    let title : String
    let source : String
    init(image:String,title:String,source:String) {
        self.image = image
        self.title = title
        self.source = source
    }
}

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var videoScreenShot: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
