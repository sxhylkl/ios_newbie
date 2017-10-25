//
//  ItemCell.swift
//  HomePwner Pro
//
//  Created by 华海智 on 2017/10/25.
//  Copyright © 2017年 海志. All rights reserved.
//

import UIKit
class ItemCell: UITableViewCell {
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    func updateLabels()  {
        let bodyFont = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.font = bodyFont
        ageLabel.font = bodyFont
        
        numberLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
    }
}
