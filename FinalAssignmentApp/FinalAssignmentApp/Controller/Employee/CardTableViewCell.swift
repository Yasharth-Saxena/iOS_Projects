//
//  CardTableViewCell.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 30/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var empId: UILabel!
    @IBOutlet weak var empName: UILabel!
    @IBOutlet weak var empSalary: UILabel!
    @IBOutlet weak var empAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardImageView.image = UIImage(named: "noImage")
        cardImageView.layer.cornerRadius = cardImageView.frame.size.width / 2
        cardImageView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCardTableViewCell(id: String, name: String, salary: String, age: String) {
        self.empId.text = id
        self.empName.text = name
        self.empSalary.text = salary
        self.empAge.text = age
    }

}
