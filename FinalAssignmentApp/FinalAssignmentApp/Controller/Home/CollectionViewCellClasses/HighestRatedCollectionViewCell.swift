//
//  HighestRatedCollectionViewCell.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 28/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class HighestRatedCollectionViewCell: UICollectionViewCell {
    static let identifer = "HighestRatedCollectionViewCell"

    @IBOutlet weak var highestRatedImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        highestRatedImageView.layer.cornerRadius = layer.cornerRadius
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifer, bundle: nil)
    }
    
}
