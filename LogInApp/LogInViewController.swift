//
//  ViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 13.02.2023.
//

import UIKit

final class LogInViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let validUserName = "User"
    private let validPassword = "password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingVC = segue.destination as? GreetingViewController
        else {
            return
        }
        greetingVC.enteredUserName = userNameTextField.text ?? ""
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func logInButtonTapped() {
        guard let userName = userNameTextField.text,
              let password = passwordTextField.text,
              userName == validUserName,
              password == validPassword
        else {
            showAlert(
                title: "Invalid User Name or Password",
                message: "Please enter correct User Name or password."
            )
            passwordTextField.text = ""
            return
        }
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func userNameReminderButtonTapped() {
        showAlert(
            title: "Your name is",
            message: validUserName
        )
    }
    
    @IBAction func passwordReminderButtonTapped() {
        showAlert(
            title: "Your password is",
            message: validPassword
        )
    }
}

extension LogInViewController {
    private func clearPassword() {
        passwordTextField.text = ""
    }
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonTapped()
        }
        return true
    }
}

