//
//  3ViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 16.02.2023.
//

import UIKit

final class OccupationViewController: UIViewController {
    
    @IBOutlet var occupationImage: UIImageView!
    @IBOutlet var legendTextView: UITextView!
    
    var user: User!

    private let viewControllerIdentifier = ViewControllerIdentifier.occupation
    
    private var imageNames = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradientLayer(
            topColor: UIColor(named: "primaryColor") ?? UIColor.systemYellow,
            bottomColor: UIColor(named: "secondaryColor") ?? UIColor.systemBrown
            )
        
        imageNames = getImageName(viewController: viewControllerIdentifier)
        occupationImage.image = getImage(from: imageNames)
        
        legendTextView.text = getLegend(for: viewControllerIdentifier)
    }
}
