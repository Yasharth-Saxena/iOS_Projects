//
//  PopularCollectionViewCell.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 28/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    static let identifier = "PopularCollectionViewCell"
    
    @IBOutlet weak var popularImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        popularImageView.layer.cornerRadius = layer.cornerRadius
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
