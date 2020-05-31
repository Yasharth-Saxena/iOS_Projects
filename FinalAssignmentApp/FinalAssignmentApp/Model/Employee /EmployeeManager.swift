//
//  EmployeeManager.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 30/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import Foundation

class EmployeeManager {
    static let shared = EmployeeManager()
    fileprivate let baseURL = "http://dummy.restapiexample.com/api/v1/employees"
    var empDataArray = [EmpModel]()
    
    func getEmployeeData(completion: @escaping (Result<[EmpModel], Error>) -> Void) {
        if let url = URL(string: baseURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    print("Employee API Status: \(httpResponse.statusCode)")
                }
                
                guard let data = data, error == nil else {
                    completion(.failure(error!))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(EmpData.self, from: data)
                    self.createEmployeeArray(with: decodedData)
                    completion(.success(self.empDataArray))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
    
    func createEmployeeArray(with model: EmpData) {
        for i in 0...23 {
            let id = model.data[i].id
            let eName = model.data[i].empName
            let eSalary = model.data[i].empSalary
            let eAge = model.data[i].empAge
            let someEmployeeInstance = EmpModel(id: id, employeeName: eName, employeeSalary: eSalary, employeeAge: eAge)
            self.empDataArray.append(someEmployeeInstance)
        }
    }
    
}
