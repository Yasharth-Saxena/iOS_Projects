//
//  SignUpViewController.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 31/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the error label as soon as the view loads up
        errorLabel.alpha = 0
        
    }
    
    @IBAction func dismissTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        let error = validateTextFields()
        
        if error != nil {
            // this means there was an error
            self.showError(error!)
        } else {
            // get the data from the textFields
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let userName = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // create the user
            Auth.auth().createUser(withEmail: userName, password: password) { (result, error) in
                if error != nil {
                    // there was an error creating the user
                    self.showError("Error creating user")
                } else {
                    // the user was created successfully now we can store additional details for the user
                    
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["first_name": firstName, "last_name": lastName, "uid": result!.user.uid]) { (databaseError) in
                        if databaseError != nil {
                            self.showError("Couldn't add additional info about the user")
                        }
                    }
                }
            }
            
            // transition to home screen
            self.goToWelcomeScreen()
        }
    }
    
    // this function helps validate the text fields to see if they're correctly filled up, returns nil is everything is fine otherwise a string that represents the error
    private func validateTextFields() -> String? {
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all the required text fields"
        }
        
        let clearPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if AppModel.isPasswordValid(clearPassword) == false {
            // password isn't secure enough
            return "Please ensure that your password is atleast 8 characters long, has atleast one special character and a number"
        }
        
        
        return nil
    }
    
    private func showError(_ error: String) {
        errorLabel.text = error
        errorLabel.alpha = 1
    }
    
    // goes to the welcome screen after the user successfully logs in or signs up
    private func goToWelcomeScreen() {
        let welcomeScreen = storyboard?.instantiateViewController(identifier: "WelcomeVC") as? WelcomeViewController
        view.window?.rootViewController = welcomeScreen
        view.window?.makeKeyAndVisible()
        
    }

}
