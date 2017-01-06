//
//  PlayerCell.swift
//  Project15-SwipeableCell
//
//  Created by 赵瑞生 on 2017/1/6.
//  Copyright © 2017年 赵瑞生. All rights reserved.
//

import UIKit


struct player {
    let image: String
    let name: String
}


class PlayerCell: UITableViewCell {
    

    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var playerName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
