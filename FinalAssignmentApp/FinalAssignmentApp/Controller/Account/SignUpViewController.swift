//
//  SignUpViewController.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 31/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func dismissTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
