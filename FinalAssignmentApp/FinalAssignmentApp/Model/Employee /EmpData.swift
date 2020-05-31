//
//  EmpData.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 30/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import Foundation

struct EmpData: Decodable {
    let data: [EmployeeData]
}

struct EmployeeData: Decodable {
    let id: String
    let empName: String
    let empSalary: String
    let empAge: String
    
    enum CodingKeys: String, CodingKey {
        case id, empName = "employee_name", empSalary = "employee_salary", empAge = "employee_age"
    }
}
