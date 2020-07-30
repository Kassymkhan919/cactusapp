//
//  BreakViewController.swift
//  Cactus
//
//  Created by kasymhan on 7/29/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import UIKit

class BreakViewController: UIViewController {

    @IBOutlet var cactusImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       cactusImageView.layer.cornerRadius = cactusImageView.frame.width / 2
        cactusImageView.layer.masksToBounds = true
    }
   
}
