//
//  GetImage.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 21.02.2023.
//

import UIKit

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
