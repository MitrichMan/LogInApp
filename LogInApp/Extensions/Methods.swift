//
//  GetLegend.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 21.02.2023.
//

import UIKit

// MARK: - Extension for getting legend from array for viewController

extension UIViewController {
    func getLegend(for viewController: ViewControllerIdentifier) -> String{
        var legendText = ""
        
        for legend in Person.getPersonData().legends {
            if legend.destination == viewController {
                legendText = legend.text
            }
        }
        return legendText
    }
}

// MARK: - Extension for getting image names from array for viewController

extension UIViewController {
    func getImageName (viewController: ViewControllerIdentifier) -> [String] {
        var imageNames = [""]
        for image in Person.getPersonData().images {
            if image.destination == viewController {
                imageNames = image.name
            }
        }
        return imageNames
    }
}

// MARK: - Extension for assigning images to imageViews
extension UIViewController {
    func getImage(from names: [String]) -> UIImage {
        var image = UIImage()
        for name in names {
            image = UIImage(named: name)!
        }
        return image
    }
}
