//
//  ViewController.swift
//  ConnectApp
//
//  Created by stephane verardo on 16/01/2020.
//  Copyright © 2020 stephane verardo. All rights reserved.
//

import UIKit
import Firebase


class SignupController: UIViewController {

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        setupTextFieldManager()
    }

   private func setUpButton() {
        signupButton.layer.cornerRadius = 20
        signupButton.layer.borderWidth = 3
        signupButton.layer.borderColor = UIColor.white.cgColor
        
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 3
        loginButton.layer.borderColor = UIColor.white.cgColor
    
    NameTextField.layer.cornerRadius = 17
    NameTextField.layer.borderWidth = 3
    NameTextField.layer.borderColor = UIColor.white.cgColor
    
    passwordTextField.layer.cornerRadius = 17
    passwordTextField.layer.borderWidth = 3
    passwordTextField.layer.borderColor = UIColor.white.cgColor
    
    emailTextField.layer.cornerRadius = 17
    emailTextField.layer.borderWidth = 3
    emailTextField.layer.borderColor = UIColor.white.cgColor
    }
    
    private func setupTextFieldManager(){
        NameTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    @objc private func hideKeyboard() {
        NameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
    }
    
    @IBAction func signupButtonWasPressed(_ sender: UIButton) {
        if NameTextField.text != "" && passwordTextField.text != "" && emailTextField.text != "" {
            print("\(NameTextField.text ?? "No name") est bien inscrit")
        }
        else {
            alertMessage()
        }
        
        
    }
        func alertMessage() {
            let alertVC = UIAlertController(title: "Error", message: "It seems you forget to fill out !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertVC, animated: true, completion: nil)
        
     }
    
    @IBAction func loginButtonWasPressed(_ sender: UIButton) {
    }
    
}

extension SignupController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
