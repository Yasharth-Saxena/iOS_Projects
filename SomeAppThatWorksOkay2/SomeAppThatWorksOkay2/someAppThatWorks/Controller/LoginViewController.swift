//
//  LoginViewController.swift
//  someAppThatWorks
//
//  Created by Yasharth Saxena on 12/04/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        congfigureTextFields()
        configureTapGesture()
        
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dealWithTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dealWithTap() {
        view.endEditing(true)
    }
    
    private func congfigureTextFields() {
        textFieldOne.delegate = self
        textFieldTwo.delegate = self
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
