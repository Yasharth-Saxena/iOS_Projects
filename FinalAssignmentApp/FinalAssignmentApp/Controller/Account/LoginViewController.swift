//
//  LoginViewController.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 31/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the error label when the view loads up
        errorLabel.alpha = 0
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        // validate the textFields
        let textFieldError = validateTextFields()
        if textFieldError != nil {
            // that means the text fields have something wrong with them
            self.showError(textFieldError!)
        } else {
            // get data from the textFields
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // finally let the user sign in using FirebaseAuth
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    // can't log user in
                    self.showError(error.localizedDescription)
                } else {
                    // goes to the welcome screen after successful login
                    self.goToWelcomeScreen()
                }
            }
        }
    
    }
    
    private func validateTextFields() -> String? {
        
        // checking if the text fields are empty
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in the required text fields"
        }
        
        
        return nil
    }
    
    private func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    private func goToWelcomeScreen() {
        let welcomeScreen = storyboard?.instantiateViewController(identifier: "WelcomeVC") as? WelcomeViewController
        view.window?.rootViewController = welcomeScreen
        view.window?.makeKeyAndVisible()
        
    }
    
    
    
}
