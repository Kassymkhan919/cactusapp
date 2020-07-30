//
//  onboardingViewController.swift
//  Cactus
//
//  Created by kasymhan on 7/29/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import UIKit

class onboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapNextButton() {
        performSegue(withIdentifier: "showSession", sender: nil)
    }
}
