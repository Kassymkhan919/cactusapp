//
//  CountdownTimer.swift
//  Cactus
//
//  Created by dev on 7/31/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import Foundation

class CountdownTimer {
    var timer: Timer?
    var secondsLeft: Int
    
    let secondsLeftChangeHandler: (Int) -> Void
    
    init(durationInSeconds: Int, secondsLeftChangeHandler: @escaping (Int) -> Void) {
        secondsLeft = durationInSeconds
        self.secondsLeftChangeHandler = secondsLeftChangeHandler
    }
    
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.secondsLeft -= 1
            self.secondsLeftChangeHandler(self.secondsLeft)
            
            if self.secondsLeft == 0{
                self.stopSession()
            }
        }
    }
    
    func stopSession() {
        self.timer?.invalidate()
        self.timer = nil
    }
}
