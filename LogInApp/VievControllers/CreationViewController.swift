//
//  4ViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 16.02.2023.
//

import UIKit

final class CreationViewController: UIViewController {

    @IBOutlet var creationImage: UIImageView!
    @IBOutlet var legendTextView: UITextView!
       
    var user: User!

    private let viewControllerIdentifier = ViewControllerIdentifier.creation
    
    private var imageNames = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradientLayer(
            topColor: UIColor(named: "primaryColor") ?? UIColor.systemYellow,
            bottomColor: UIColor(named: "secondaryColor") ?? UIColor.systemBrown
            )
        
        imageNames = getImageName(viewController: viewControllerIdentifier)
        creationImage.image = getImage(from: imageNames)
        
        legendTextView.text = getLegend(for: viewControllerIdentifier)
    }
    
    private func getImage(from names: [String]) -> UIImage {
        var image = UIImage()
        for name in names {
            image = UIImage(named: name)!
        }
        return image
    }
}
