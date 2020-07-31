//
//  SessionViewController.swift
//  Cactus
//
//  Created by kasymhan on 7/29/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController {

    @IBOutlet var cactusImageView: UIImageView!
    @IBOutlet var plantButtonView: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cactusImageView.layer.cornerRadius = cactusImageView.frame.width / 2
        cactusImageView.layer.masksToBounds = true
        
        plantButtonView.layer.cornerRadius = 14
        plantButtonView.layer.masksToBounds = true
    }

    
    @IBAction func didTapPlantButton() {
//        print("Start Session")
        performSegue(withIdentifier: "showBreakSession", sender: nil)
    }
}

