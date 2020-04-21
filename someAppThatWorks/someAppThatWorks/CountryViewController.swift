//
//  CountryViewController.swift
//  someAppThatWorks
//
//  Created by Yasharth Saxena on 20/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {

    @IBOutlet weak var countryTableView: UITableView!
    var appManager = AppManager()
    var flagImage: UIImage?
    var countryArray = [CountryModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTableView.dataSource = self
        countryTableView.delegate = self
        
        AppManager.shared.getCountries { [weak self] (result) in
            switch result {
            case .success(let decodedArray):
                self?.countryArray = decodedArray
                DispatchQueue.main.async {
                    self?.countryTableView.reloadData()
                }
            case .failure(let error):
                print("Completion failed: \(error)")
            }
        }
        
    }

}

extension CountryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryDataCell", for: indexPath)
        cell.textLabel?.text = self.countryArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        appManager.getCountryCode(countryCode: self.countryArray[indexPath.row].alpha2Code)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}



