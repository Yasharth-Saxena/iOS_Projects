//
//  CardViewController.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 30/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    var employees = [EmpModel]()

    @IBOutlet weak var cardTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        cardTableView.dataSource = self
        cardTableView.delegate = self
        
        EmployeeManager.shared.getEmployeeData { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let employeeData):
                self.employees = employeeData
                DispatchQueue.main.async {
                    self.cardTableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching employee data: \(error)")
            }
        }
    }

}

extension CardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardTableViewCell
        let id = employees[indexPath.row].id
        let name = employees[indexPath.row].employeeName
        let salary = employees[indexPath.row].employeeSalary
        let age = employees[indexPath.row].employeeAge
        cell.configureCardTableViewCell(id: id, name: name, salary: salary, age: age)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
