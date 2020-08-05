//
//  Session.swift
//  Cactus
//
//  Created by dev on 7/31/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import Foundation

class Session {
    let durationInSeconds: Int
    let startDate: Date
    
    init(durationInSeconds: Int, startDate: Date){
        self.durationInSeconds = durationInSeconds
        self.startDate = startDate
    }
}
