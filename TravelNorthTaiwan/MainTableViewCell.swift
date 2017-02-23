//
//  MainTableViewCell.swift
//  TravelNorthTaiwan
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 VictorBasic. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOfNTaiwan: UIImageView!
    @IBOutlet weak var textLabelOfNTaiwan: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
