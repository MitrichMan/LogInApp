//
//  ActivityViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 16.02.2023.
//

import UIKit

final class ActivityViewController: UIViewController {
    
    @IBOutlet var activityTextView: UITextView!
    
    @IBOutlet var firstActivityImage: UIImageView!
    @IBOutlet var secondActivityImage: UIImageView!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradientLayer(
            topColor: UIColor(named: "primaryColor") ?? UIColor.systemYellow,
            bottomColor: UIColor(named: "secondaryColor") ?? UIColor.systemBrown
            )

        activityTextView.text = Person.getPersonData().activityLegend
        
        firstActivityImage.image = UIImage(named: Person.getPersonData().images[3])
        secondActivityImage.image = UIImage(named: Person.getPersonData().images[4])
    }
  }
