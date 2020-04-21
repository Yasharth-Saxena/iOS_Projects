//
//  LanguageCellClass.swift
//  someAppThatWorks
//
//  Created by Yasharth Saxena on 19/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class LanguageCellClass: UITableViewCell {

    @IBOutlet weak var langMainImage: UIImageView!
    @IBOutlet weak var langLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
