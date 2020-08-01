import Foundation

class SessionView: SessionManagerDelegate {
    var sessionManager: SessionManager?
    
    func userDidStartSession(durationInSeconds: Int) {
        sessionManager?.startSession(session: Session(durationInSeconds: durationInSeconds))
    }
    
    func showSessionStarted() {
        print("Session Started")
    }
    
    func showTimeLeft(secondsLeft: Int) {
        print("\(secondsLeft)")
    }
    
    func showSessionEnded() {
        print("Session Ended")
    }
    
    func userCancelledSession() {
        print("Session Cancelled")
        sessionManager?.stopSession()
    }
}

class Session {
    let durationInSeconds: Int
    
    
    init(durationInSeconds: Int){
        self.durationInSeconds = durationInSeconds
    }
}

protocol SessionManagerDelegate {
    func showSessionStarted()
    func showTimeLeft(secondsLeft: Int)
    func showSessionEnded()
    func userCancelledSession()
}

class SessionManager {
    var sessionDelegate: SessionManagerDelegate
    
    var timer: Timer?
    
    
    init(sessionDelegate: SessionManagerDelegate){
        self.sessionDelegate = sessionDelegate
    }
    
    func stopSession() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func startSession(session: Session){
        sessionDelegate.showSessionStarted()
        sessionDelegate.showTimeLeft(secondsLeft: session.durationInSeconds)
        var sessionDuration = session.durationInSeconds
//        self.sessionView.showTimeLeft(secondsLeft: sessionDuration)
        // decrease timer every 1 sec
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            sessionDuration -= 1
            self.sessionDelegate.showTimeLeft(secondsLeft: sessionDuration)
            
            
            if sessionDuration == 0{
                self.sessionDelegate.showSessionEnded()
                SessionStorage.shared.addSession(session: session)
                
                self.stopSession()
            }
        }
    }
}

class SessionStorage {
    var sessions = [Session]()
    static let shared = SessionStorage()
    
    func addSession(session: Session) {
        sessions.append(session)
    }
}


protocol BreakManagerDelegate {
    func userStartedBreak(durationInSeconds: Int)
    func showStartBreak()
    func breakEnded()
    func showTimeLeft(secondsLeft: Int)
}

class BreakManager {
    var breakDelegate: BreakManagerDelegate
    var timer: Timer?

    init(breakDelegate: BreakManagerDelegate) {
        self.breakDelegate = breakDelegate
    }

    func stopSession() {
        self.timer?.invalidate()
        self.timer = nil
    }

    func startBreak(session: Session){
        breakDelegate.showStartBreak()
        breakDelegate.showTimeLeft(secondsLeft: session.durationInSeconds)
        var breakDuration = session.durationInSeconds
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            breakDuration -= 1
            self.breakDelegate.showTimeLeft(secondsLeft: breakDuration)

            if breakDuration == 0 {
                self.breakDelegate.breakEnded()
                self.stopSession()
            }
        })
    }

}



class BreakView: BreakManagerDelegate {
    var breakManager: BreakManager?

    func userStartedBreak(durationInSeconds: Int) {
        breakManager?.startBreak(session: Session(durationInSeconds: durationInSeconds))
    }

    func showStartBreak(){
        print("Break Started")
    }

    func breakEnded() {
        print("Break Ended")
    }

    func showTimeLeft(secondsLeft: Int) {
        print("\(secondsLeft)")
    }
}


let breakView = BreakView()
breakView.breakManager = BreakManager(breakDelegate: breakView)
breakView.userStartedBreak(durationInSeconds: 5)



//let sessionView = SessionView()
//sessionView.sessionManager = SessionManager(sessionDelegate: sessionView)
//
//
//sessionView.userDidStartSession(durationInSeconds: 3)
//
//DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
//    print(SessionStorage.shared.sessions.count)
//}


//let view = SessionView()
//
//view.sessionManager = SessionManager(sessionDelegate: view) //Daniyar added this line as we need to initialize SessionManger beforehand
//view.userDidStartSession(durationInSeconds: 10)
//
//DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
//    view.userCancelledSession()
//}
//





