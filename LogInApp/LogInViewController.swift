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
        let greetingVC = segue.destination
        guard let greetingVC = greetingVC as? GreetingViewController else {
            return
        }
        greetingVC.enteredUserName = userNameTextField.text ?? ""
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func logInButtonTapped() {
        guard userNameTextField.text == validUserName,
              passwordTextField.text == validPassword
        else {
            showAlert(
                title: "Invalid User Name or Password",
                message: "Please enter correct User Name or password.",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func logInDataReminder(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Your name is", message: validUserName)
        : showAlert(title: "Your password is", message: validPassword)
    }
}

extension LogInViewController {
    private func showAlert(
        title: String,
        message: String,
        textField: UITextField? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = ""
        }
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

