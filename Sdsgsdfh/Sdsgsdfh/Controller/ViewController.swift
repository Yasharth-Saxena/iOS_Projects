//
//  ViewController.swift
//  Sdsgsdfh
//
//  Created by Yasharth Saxena on 18/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var someArray = [AppModel]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        AppManager.shared.performRequest { (result) in
            switch result {
            case .success(let parsedDataArray):
                self.someArray = parsedDataArray
            case .failure(let error):
                print("error fetching data: \(error)")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.someArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCellClass
        cell.textlbl.text = self.someArray[indexPath.row].name
        return cell
    }
    
}


