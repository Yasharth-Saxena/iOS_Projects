//
//  LanguageViewController.swift
//  someAppThatWorks
//
//  Created by Yasharth Saxena on 20/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController {
    
    @IBOutlet weak var languageTableView: UITableView!
    var languageArray = [CountryModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        languageTableView.dataSource = self
        languageTableView.delegate = self
        
        AppManager.shared.getCountries { (result) in
            switch result {
            case .success(let decodedArray):
                self.languageArray = decodedArray
                DispatchQueue.main.async {
                    self.languageTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    

}

extension LanguageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageDataCell", for: indexPath)
        let langName = self.languageArray[indexPath.row].languages[0].name
        cell.textLabel?.text = langName
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
}


