//
//  ViewController.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 16.02.2023.
//

import UIKit

final class AboutMeViewController: UIViewController {

    @IBOutlet var aboutMeImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateOfBirthLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var sexLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var occupationLabel: UILabel!
    
    var name = ""
    var dateOfBirth = ""
    var city = ""
    var sex = ""
    var status = ""
    var occupation = ""
    var bioLegend = ""
    
    var aboutMePhoto = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGradientLayer(
            topColor: UIColor(named: "primaryColor") ?? UIColor.systemYellow,
            bottomColor: UIColor(named: "secondaryColor") ?? UIColor.systemBrown
        )
        
        nameLabel.text = name
        dateOfBirthLabel.text = dateOfBirth
        cityLabel.text = city
        sexLabel.text = sex
        statusLabel.text = status
        occupationLabel.text = occupation
        
        aboutMeImage.image = UIImage(named: aboutMePhoto)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else {
            return
        }
        bioVC.bioLegend = bioLegend
    }
}
