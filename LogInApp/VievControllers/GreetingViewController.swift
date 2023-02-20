//
//  GreetingViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 13.02.2023.
//

import UIKit

final class GreetingViewController: UIViewController {
        
    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradientLayer(
            topColor: UIColor(named: "primaryColor") ?? UIColor.systemYellow,
            bottomColor: UIColor(named: "secondaryColor") ?? UIColor.systemBrown
            )
        
        welcomeLabel.text = "Добро пожаловать, \(Person.getPersonData().name)"
    }
}
