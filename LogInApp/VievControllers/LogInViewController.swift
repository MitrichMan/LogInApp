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
        userNameTextField.text = "User"
        passwordTextField.text = "password"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else {
            return
        }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let greetingVC = viewController as? GreetingViewController {
                greetingVC.nameOfUser = user.person.name
            } else if let occupationVC = viewController as? OccupationViewController {
                occupationVC.occupationLegend = user.person.occupationLegend
                occupationVC.occupationPhoto = user.person.images[1]
            } else if let creationVC = viewController as? CreationViewController {
                creationVC.creationLegend = user.person.creationLegend
                creationVC.creationPhoto = user.person.images[2]
            } else if let activityVC = viewController as? ActivityViewController {
                activityVC.ActivityLegend = user.person.activityLegend
                activityVC.firstActivityPhoto = user.person.images[3]
                activityVC.secondActivityPhoto = user.person.images[4]
            } else if let navigationVC = viewController as? UINavigationController {
                if let aboutMeVC = navigationVC.topViewController as? AboutMeViewController {
                    aboutMeVC.name = user.person.name
                    aboutMeVC.dateOfBirth = user.person.dateOfBirth
                    aboutMeVC.city = user.person.city
                    aboutMeVC.sex = user.person.sex
                    aboutMeVC.status = user.person.status
                    aboutMeVC.occupation = user.person.occupation
                    aboutMeVC.bioLegend = user.person.bioLegend
                    aboutMeVC.aboutMePhoto = user.person.images[0]
                }
            }
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func logInButtonTapped() {
        guard userNameTextField.text == user.userName,
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
        ? showAlert(title: "Your name is", message: user.userName)
        : showAlert(title: "Your password is", message: user.password)
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

