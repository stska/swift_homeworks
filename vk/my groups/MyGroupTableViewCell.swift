//
//  MyGroupTableViewCell.swift
//  vk
//
//  Created by user155176 on 15/08/2019.
//  Copyright © 2019 user155176. All rights reserved.
//

import UIKit

class MyGroupTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var labelGroup: UILabel!
    
    @IBOutlet weak var uiGroupImage: UIImageView!
    
}
