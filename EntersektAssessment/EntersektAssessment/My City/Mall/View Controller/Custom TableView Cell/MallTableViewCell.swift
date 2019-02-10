//
//  MallTableViewCell.swift
//  EntersektAssessment
//
//  Created by Idris SOP on 2019/02/10.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

class MallTableViewCell: UITableViewCell {

    @IBOutlet var mallName: UILabel?
    @IBOutlet var cityName: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
