//
//  VideoCell.swift
//  Project10-PlayLocalVideo
//
//  Created by 赵瑞生 on 2016/12/29.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

class VideoCell: UITableViewCell {
    
    
    @IBOutlet weak var videoScreenshot: UIImageView!
    
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
}
