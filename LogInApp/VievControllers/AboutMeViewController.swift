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

    var user: User!
    
    private let viewControllerIdentifier = ViewControllerIdentifier.aboutMe
    
    private var imageNames = [""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGradientLayer(
            topColor: UIColor(named: "primaryColor") ?? UIColor.systemYellow,
            bottomColor: UIColor(named: "secondaryColor") ?? UIColor.systemBrown
        )
        
        imageNames = getImageName(viewController: viewControllerIdentifier)
        aboutMeImage.image = getImage(from: imageNames)
                
        nameLabel.text = Person.getPersonData().name
        dateOfBirthLabel.text = Person.getPersonData().dateOfBirth
        cityLabel.text = Person.getPersonData().city
        sexLabel.text = Person.getPersonData().sex
        statusLabel.text = Person.getPersonData().status
        occupationLabel.text = Person.getPersonData().occupation
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else {
            return
        }
        bioVC.user = user
    }
    
    private func getImage(from names: [String]) -> UIImage {
        var image = UIImage()
        for name in names {
            image = UIImage(named: name)!
        }
        return image
    }
}
