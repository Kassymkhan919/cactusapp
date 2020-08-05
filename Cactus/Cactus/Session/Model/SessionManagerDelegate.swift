//
//  SessionManagerDelegate.swift
//  Cactus
//
//  Created by dev on 7/31/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import Foundation

protocol SessionManagerDelegate {
    func showSessionStarted(session: Session)
    func showTimeLeft(secondsLeft: Int)
    func showSessionEnded(session: Session)
    func userCancelledSession()
}

class SessionManager {
    var sessionDelegate: SessionManagerDelegate
    
    var timer: CountdownTimer?
    
    
    init(sessionDelegate: SessionManagerDelegate){
        self.sessionDelegate = sessionDelegate
    }
    
    func stopSession() {
        self.timer?.stopSession()
        sessionDelegate.userCancelledSession()
    }
    
    func startSession(session: Session){
        // decrease timer every 1 sec
        timer = CountdownTimer(durationInSeconds: session.durationInSeconds) {secondsLeft in
            if secondsLeft == 0 {
                SessionsStorage.shared.addSession(session)
                self.sessionDelegate.showSessionEnded(session: session)
            }
            else {
                self.sessionDelegate.showTimeLeft(secondsLeft: secondsLeft)
            }
        }
        
        timer?.start()
        sessionDelegate.showSessionStarted(session: session)
    }
}
