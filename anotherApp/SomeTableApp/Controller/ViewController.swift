//
//  ViewController.swift
//  SomeTableApp
//
//  Created by Yasharth Saxena on 11/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appBrain = AppBrain()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150.0
        default:
            return 45.0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return self.appBrain.section2Array.count
        case 2:
            return self.appBrain.section3Array.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCellClass
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "anotherCustomCell", for: indexPath)
            cell.textLabel?.text = appBrain.section2Array[indexPath.row].title
            cell.imageView?.image = appBrain.section2Array[indexPath.row].image
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "anotherCustomCell", for: indexPath)
            cell.textLabel?.text = appBrain.section3Array[indexPath.row].title
            cell.imageView?.image = appBrain.section3Array[indexPath.row].image
            return cell
        default:
            return UITableViewCell() 
        }
    }
}

