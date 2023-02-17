//
//  3ViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 16.02.2023.
//

import UIKit

final class OccupationViewController: UIViewController {
    
    @IBOutlet var occupationImage: UIImageView!
    @IBOutlet var occupationLegendTextView: UITextView!

    var occupationLegend = ""
    var occupationPhoto = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradientLayer(
            topColor: UIColor(named: "primaryColor") ?? UIColor.systemYellow,
            bottomColor: UIColor(named: "secondaryColor") ?? UIColor.systemBrown
            )
        
        occupationLegendTextView.text = occupationLegend
        occupationImage.image = UIImage(named: occupationPhoto)
    }
}
