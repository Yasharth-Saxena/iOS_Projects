//
//  ViewController.swift
//  someAppThatWorks
//
//  Created by Yasharth Saxena on 12/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appBrain = AppBrain() 

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
        tableView.dataSource = self
        tableView.rowHeight = 60 
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "signInSegue", sender: self)
    }
    
    @IBAction func joinTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "joinSegue", sender: self)
    }
    
    private func configureImageView() {
        mainImage.image = UIImage(named: "noImage")
        mainImage.layer.cornerRadius = mainImage.frame.size.width / 2
        mainImage.clipsToBounds = true
        
    }


}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.appBrain.section2Array.count
        } else {
            return self.appBrain.section3Array.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
            cell.textLabel?.text = self.appBrain.section2Array[indexPath.row].title
            cell.imageView?.image = self.appBrain.section2Array[indexPath.row].image
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
            cell.textLabel?.text = self.appBrain.section3Array[indexPath.row].title
            cell.imageView?.image = self.appBrain.section3Array[indexPath.row].image
            return cell
        }
    }
}

