//
//  TrendingCollectionViewCell.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 28/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    static let identifier = "TrendingCollectionViewCell"
    
    @IBOutlet weak var trendingImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        layer.cornerRadius = 10
        trendingImageView.layer.cornerRadius = layer.cornerRadius
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

}
