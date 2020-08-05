//
//  SessionStorage.swift
//  Cactus
//
//  Created by dev on 8/4/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import Foundation


class SessionsStorage {
    static let shared = SessionsStorage()
    
    var sessions = [Session]()
    
    func addSession(_ session: Session) {
        
        for i in 0...20 {
            let session1 = Session(durationInSeconds: 10 * (i+1), startDate: session.startDate)
            sessions.append(session1)
        }
    }
}
