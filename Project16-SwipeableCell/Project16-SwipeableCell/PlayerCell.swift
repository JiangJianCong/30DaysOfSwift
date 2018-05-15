//
//  PlayerCell.swift
//  Project16-SwipeableCell
//
//  Created by space on 2018/5/8.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

struct player {
    let image : String
    let name : String
}

class PlayerCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
