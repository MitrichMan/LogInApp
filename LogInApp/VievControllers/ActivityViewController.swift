//
//  ActivityViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 16.02.2023.
//

import UIKit

final class ActivityViewController: UIViewController {
    
    @IBOutlet var firstActivityImage: UIImageView!
    @IBOutlet var secondActivityImage: UIImageView!
        
    @IBOutlet var legendTextView: UITextView!

    var user: User!

    private let viewControllerIdentifier = ViewControllerIdentifier.activity
    
    private var imageNames = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradientLayer(
            topColor: UIColor(named: "primaryColor") ?? UIColor.systemYellow,
            bottomColor: UIColor(named: "secondaryColor") ?? UIColor.systemBrown
            )

        imageNames = getImageName(viewController: viewControllerIdentifier)
        getActivityImages(from: imageNames)
        
        legendTextView.text = getLegend(for: viewControllerIdentifier)

    }
    
    private func getActivityImages(from names: [String]) {
        var names = names
        firstActivityImage.image = UIImage(named: names.removeFirst())
        secondActivityImage.image = UIImage(named: names.removeFirst())
    }
  }
