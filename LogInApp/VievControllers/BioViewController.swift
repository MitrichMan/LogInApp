//
//  2ViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 16.02.2023.
//

import UIKit

final class BioViewController: UIViewController {

    @IBOutlet var legendTextView: UITextView!
        
    var user: User!

    private let viewControllerIdentifier = ViewControllerIdentifier.bio
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradientLayer(
            topColor: UIColor(named: "primaryColor") ?? UIColor.systemYellow,
            bottomColor: UIColor(named: "secondaryColor") ?? UIColor.systemBrown
            )
        
        legendTextView.text = getLegend(for: viewControllerIdentifier)
    }
}
