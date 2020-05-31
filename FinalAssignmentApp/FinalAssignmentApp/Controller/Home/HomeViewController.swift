//
//  HomeViewController.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 13/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView.register(MainTableViewCell.nib(), forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.register(TrendingTableViewCell.nib(), forCellReuseIdentifier: TrendingTableViewCell.identifier)
        tableView.register(PopularTableViewCell.nib(), forCellReuseIdentifier: PopularTableViewCell.identifier)
        tableView.register(HighestRatedTableViewCell.nib(), forCellReuseIdentifier: HighestRatedTableViewCell.identifier)
        tableView.register(BestTableViewCell.nib(), forCellReuseIdentifier: BestTableViewCell.identifier)
    }


}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.identifier, for: indexPath) as! TrendingTableViewCell
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier:  PopularTableViewCell.identifier, for: indexPath) as! PopularTableViewCell
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HighestRatedTableViewCell.identifier, for: indexPath) as! HighestRatedTableViewCell
            return cell 
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: BestTableViewCell.identifier, for: indexPath) as! BestTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}


