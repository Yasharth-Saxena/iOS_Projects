//
//  RegisterViewController.swift
//  someAppThatWorks
//
//  Created by Yasharth Saxena on 13/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextFields()
        configureTapGesture()
    }
    
    private func configureTextFields() {
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dealWithTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dealWithTap() {
        view.endEditing(true)
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
