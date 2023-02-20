//
//  4ViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 16.02.2023.
//

import UIKit

final class CreationViewController: UIViewController {

    @IBOutlet var creationLegendTextView: UITextView!
    @IBOutlet var creationImage: UIImageView!
    
   
    var user: User!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradientLayer(
            topColor: UIColor(named: "primaryColor") ?? UIColor.systemYellow,
            bottomColor: UIColor(named: "secondaryColor") ?? UIColor.systemBrown
            )
        
        creationLegendTextView.text = Person.getPersonData().creationLegend
        creationImage.image = UIImage(named: Person.getPersonData().images[2])
    }
}
