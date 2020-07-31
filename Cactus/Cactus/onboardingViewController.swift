//
//  onboardingViewController.swift
//  Cactus
//
//  Created by kasymhan on 7/29/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import UIKit

class onboardingViewController: UIViewController {

    @IBOutlet var uiImage: UIImageView!
    @IBOutlet var uiLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var counter = 0
    let titles = ["Welcome\nto the\nCactus app!",
    "Choose\ncactus\nto plant.",
    "Stay focused\n& productive!"]
    let buttonTitle = ["Next", "Next", "Start"]
    let imageTitles = ["onboardImage1", "onboardImage2", "onboardImage3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.layer.cornerRadius = 14
        nextButton.layer.masksToBounds = true
        
        updatePage()
    }
    
    @IBAction func didTapNextButton() {
        if counter == 2 {
            performSegue(withIdentifier: "showSession", sender: nil)
        }
        else{
            counter += 1
            updatePage()
        }
    }
    
    func updatePage() {
        uiLabel.text = titles[counter]
        uiImage.image = UIImage(named: imageTitles[counter])
        if counter == 2 {
        nextButton.setTitle(buttonTitle[counter], for: .normal)
        }
    }
}
