//
//  LoginViewController.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 31/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func loginTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func crossTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
