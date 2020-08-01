//
//  BreakManagerDelegate.swift
//  Cactus
//
//  Created by dev on 7/31/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import Foundation


protocol BreakManagerDelegate {
    func breakDidStart(aBreak: Break)
    func breakEnded(aBreak: Break)
    func showBreakTimeLeft(secondsLeft: Int)
    func breakDidCancel()
}

class BreakManager {
    var breakDelegate: BreakManagerDelegate
    var timer: Timer?
    var countdownTimer: CountdownTimer?

    init(breakDelegate: BreakManagerDelegate) {
        self.breakDelegate = breakDelegate
    }

    func startBreak(aBreak: Break){
        countdownTimer = CountdownTimer(durationInSeconds: aBreak.durationInSeconds) { secondsLeft in
            if secondsLeft == 0 {
                self.breakDelegate.breakEnded(aBreak: aBreak)
            } else {
                self.breakDelegate.showBreakTimeLeft(secondsLeft: secondsLeft)
            }
        }

        countdownTimer?.start()
        breakDelegate.breakDidStart(aBreak: aBreak)
    }
    
    
    func breakDidCancel() {
        
    }

}
