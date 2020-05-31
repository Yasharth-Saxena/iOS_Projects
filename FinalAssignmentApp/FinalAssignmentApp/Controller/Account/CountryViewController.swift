//
//  CountryViewController.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 13/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

protocol CountryDelegate {
    func didUpdateCountry(_ name: String, code: String)
}

class CountryViewController: UIViewController {

    var countryArray = [CountryModel]()
    var countryDelegate: CountryDelegate?

    @IBOutlet weak var countryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTableView.dataSource = self
        countryTableView.delegate = self

        AppManager.shared.fetchDataFromCountryAPI { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.countryArray = data
                DispatchQueue.main.async {
                    self.countryTableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}


//MARK: TableView Methods 

extension CountryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryTableCell", for: indexPath)
        cell.textLabel?.text = countryArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryName = countryArray[indexPath.row].alpha3Code
        let countryCode = countryArray[indexPath.row].alpha2Code
        countryDelegate?.didUpdateCountry(countryName, code: countryCode)
        self.dismiss(animated: true, completion: nil)
    }
}


