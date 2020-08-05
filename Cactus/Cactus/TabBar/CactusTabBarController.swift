//
//  CactusTabBarController.swift
//  Cactus
//
//  Created by dev on 8/3/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import UIKit

class CactusTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor(named: "onboardingFontColor")
        tabBar.unselectedItemTintColor = UIColor(named: "lightGrey")
    }
    

    

}
