//
//  LanguageViewController.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 16/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

protocol LanguageDelegate {
    func didUpdateLanguage(_ name: String)
}

class LanguageViewController: UIViewController {

    var languageDelegate: LanguageDelegate?
    @IBOutlet weak var langTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}


//MARK: TableView Methods
extension LanguageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppModel.shared.languageArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageTableCell", for: indexPath)
        cell.textLabel?.text = AppModel.shared.languageArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        languageDelegate?.didUpdateLanguage(AppModel.shared.languageArray[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
}
