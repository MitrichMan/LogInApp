//
//  GreetingViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 13.02.2023.
//

import UIKit

final class GreetingViewController: UIViewController {
    
    @IBOutlet var gradientView: UIView!
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var enteredUserName = ""
            
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor,
            #colorLiteral(red: 0.4373808205, green: 0.4683583379, blue: 0.9665198922, alpha: 1).cgColor
        ]
        gradientView.layer.addSublayer(gradientLayer)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 0.8)
        
        welcomeLabel.text = "Welcome, \(enteredUserName)"
    }
}
