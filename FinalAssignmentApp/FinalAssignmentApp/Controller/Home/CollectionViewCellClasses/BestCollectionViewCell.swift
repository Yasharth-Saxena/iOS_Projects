//
//  BestCollectionViewCell.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 28/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class BestCollectionViewCell: UICollectionViewCell {
    static let identifier = "BestCollectionViewCell"

    @IBOutlet weak var bestImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        bestImageView.layer.cornerRadius = layer.cornerRadius
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

}
