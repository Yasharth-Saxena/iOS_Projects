//
//  ViewController.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 13/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    var nameLabel = "AUS"
    var flagImage: UIImage? = UIImage(named: "aussieFlag")
    var langLabel = "Australian English"

    @IBOutlet weak var accountTableView: UITableView!
    @IBOutlet weak var userImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this function registers the custom nib files for the accountTableView
        AppModel.shared.registerNibs(for: accountTableView)
        AppModel.shared.roundImage(userImage)
        accountTableView.rowHeight = 60
    }

    @IBAction func signInTapped(_ sender: Any) {
        // TODO: Make a Login Screen
    }
    
    @IBAction func joinTapped(_ sender: Any) {
        // TODO: Make a SignUp Screen
    }
    
    func getFlags(with url: String) {
        if let flagURL = URL(string: url) {
            URLSession.shared.dataTask(with: flagURL) { (data, response, error) in
                guard let validData = data, error == nil else {
                    print("Error fetching flag image: \(error!)")
                    return
                }
                
                self.flagImage = UIImage(data: validData)
            }.resume()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countrySegue" {
            let countryVC = segue.destination as! CountryViewController
            countryVC.countryDelegate = self
        } else if segue.identifier == "languageSegue" {
            let languageVC = segue.destination as! LanguageViewController
            languageVC.languageDelegate = self
        }
    }
    

}


//MARK: TableView Methods 

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return AppModel.shared.section1Array.count
        case 1:
            return AppModel.shared.section2Array.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath) as! NormalCell
            cell.mainImageView.image = AppModel.shared.section1Array[indexPath.row].image
            cell.mainTitle.text = AppModel.shared.section1Array[indexPath.row].title
            return cell
        case 1:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryCell
                cell.mainImageView.image = AppModel.shared.section2Array[indexPath.row].image
                cell.mainTitle.text = AppModel.shared.section2Array[indexPath.row].title
                DispatchQueue.main.async {
                    cell.countryCodeLabel.text = self.nameLabel
                    cell.flagImageView.image = self.flagImage
                    tableView.reloadData()
                }
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as! LanguageCell
                cell.mainImageView.image = AppModel.shared.section2Array[indexPath.row].image
                cell.mainTitle.text = AppModel.shared.section2Array[indexPath.row].title
                DispatchQueue.main.async {
                    cell.languageLabel.text = self.langLabel
                    tableView.reloadData()
                }
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath) as! NormalCell
                cell.mainImageView.image = AppModel.shared.section2Array[indexPath.row].image
                cell.mainTitle.text = AppModel.shared.section2Array[indexPath.row].title
                return cell 
            }
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            break
        case 1:
            if indexPath.row == 0 {
                performSegue(withIdentifier: "countrySegue", sender: self)
            } else if indexPath.row == 1 {
                performSegue(withIdentifier: "languageSegue", sender: self)
            }
        default:
            print("Error populating the country list")
        }
    }
    
}


//MARK: CountryDelegate method

extension AccountViewController: CountryDelegate {
    func didUpdateCountry(_ name: String, code: String) {
        self.nameLabel = name
        
        let url = "https://www.countryflags.io/\(code)/shiny/64.png"
        getFlags(with: url)
    }
}


//MARK: LanguageDelegate Method

extension AccountViewController: LanguageDelegate {
    func didUpdateLanguage(_ name: String) {
        self.langLabel = name
    }
}






