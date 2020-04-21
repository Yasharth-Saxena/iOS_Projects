//
//  ViewController.swift
//  someAppThatWorks
//
//  Created by Yasharth Saxena on 12/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    let appModel = AppModel()
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 60
        
        // this function registers the nibs of all custom cells 
        self.appModel.registerNibs(for: self.tableView)
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "signInSegue", sender: self)
    }
    
    @IBAction func joinTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "joinSegue", sender: self)
    }
    
    private func configureImageView() {
        mainImage.image = UIImage(systemName: "person")
        mainImage.layer.cornerRadius = mainImage.frame.size.width / 2
        mainImage.clipsToBounds = true
        
    }
    
}

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.appModel.section2Array.count
        } else {
            return self.appModel.section3Array.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // this function handles all the logic for configuring country, language and normal cells and then returns a UITableViewCell 
        switch indexPath.section {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath) as! NormalCellClass
            cell.nomralLabel.text = appModel.section2Array[indexPath.row].title
            cell.normalMainImage.image = appModel.section2Array[indexPath.row].image
            return cell
            
        case 1:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryCellClass
                cell.countryLabel.text = appModel.section3Array[indexPath.row].title
                cell.countryMainImage.image = appModel.section3Array[indexPath.row].image
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as! LanguageCellClass
                cell.langLabel.text = appModel.section3Array[indexPath.row].title
                cell.langMainImage.image = appModel.section3Array[indexPath.row].image
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath) as! NormalCellClass
                cell.nomralLabel.text = appModel.section3Array[indexPath.row].title
                cell.normalMainImage.image = appModel.section3Array[indexPath.row].image
                return cell
            }
            
        default:
            print("Custom cell creation failed!")
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                performSegue(withIdentifier: "countrySegue", sender: self)
            } else if indexPath.row == 1 {
                performSegue(withIdentifier: "languageSegue", sender: self)
            }
        }
    }
}


