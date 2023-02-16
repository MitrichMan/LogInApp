//
//  GreetingViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 13.02.2023.
//

import UIKit

final class GreetingViewController: UIViewController {
        
    @IBOutlet var welcomeLabel: UILabel!
    
    var enteredUserName = ""
    
    private let primaryColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    private let secondaryColor = #colorLiteral(red: 0.4373808205, green: 0.4683583379, blue: 0.9665198922, alpha: 1)

            
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        welcomeLabel.text = "Welcome, \(enteredUserName)"
    }
}

extension UIView {
    func addGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0.2, y: 0.8)
        layer.insertSublayer(gradient, at: 0)
    }
}

