//
//  GetLegend.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 21.02.2023.
//

import UIKit

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
