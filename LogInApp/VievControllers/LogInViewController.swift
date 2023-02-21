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
    
    private let user = User.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.text = user.logIn
        passwordTextField.text = user.password
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else {
            return
        }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let greetingVC = viewController as? GreetingViewController {
                greetingVC.user = user
            } else if let occupationVC = viewController as? OccupationViewController {
                occupationVC.user = user
            } else if let creationVC = viewController as? CreationViewController {
                creationVC.user = user
            } else if let activityVC = viewController as? ActivityViewController {

                activityVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                if let aboutMeVC = navigationVC.topViewController as? AboutMeViewController {
                    aboutMeVC.user = user                 
                }
            }
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func logInButtonTapped() {
        guard userNameTextField.text == user.logIn,
              passwordTextField.text == user.password
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
        ? showAlert(title: "Your name is", message: user.logIn)
        : showAlert(title: "Your password is", message: user.password)
    }
}

//: MARK - Extension for alert controller
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

//: MARK - Extension for hiding keyboard
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

