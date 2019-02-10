//
//  ShopTableViewCell.swift
//  EntersektAssessment
//
//  Created by Idris SOP on 2019/02/10.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

class ShopTableViewCell: UITableViewCell {

    @IBOutlet var shopNameLabel: UILabel?
    @IBOutlet var mallNameLabel: UILabel?
    @IBOutlet var cityNameLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
