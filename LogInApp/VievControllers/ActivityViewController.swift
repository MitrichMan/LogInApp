//
//  ActivityViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 16.02.2023.
//

import UIKit

final class ActivityViewController: UIViewController {
    
    @IBOutlet var activityImageViews: [UIImageView]!

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
        getActivityImages(for: activityImageViews, with: imageNames)
        
        legendTextView.text = getLegend(for: viewControllerIdentifier)

    }
    
    private func getActivityImages(for imageViews: [UIImageView], with names: [String]) {
        for index in 0..<imageViews.count {
            guard index < names.count else { return }
            imageViews[index].image = UIImage(named: names[index])
        }
    }
}
