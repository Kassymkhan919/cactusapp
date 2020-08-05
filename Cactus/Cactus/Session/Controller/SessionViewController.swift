//
//  SessionViewController.swift
//  Cactus
//
//  Created by kasymhan on 7/29/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, SessionManagerDelegate {
    
    @IBOutlet var cactusImageView: UIImageView!
    @IBOutlet var plantButtonView: UIButton!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var countdownLabel: UILabel!
    @IBOutlet var giveUpButton: UIButton!
    
    lazy var sessionManager = SessionManager(sessionDelegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cactusImageView.layer.cornerRadius = cactusImageView.frame.width / 2
        cactusImageView.layer.masksToBounds = true
        
        plantButtonView.layer.cornerRadius = 14
        plantButtonView.layer.masksToBounds = true
        
        giveUpButton.layer.cornerRadius = 14
        giveUpButton.layer.masksToBounds = true
        giveUpButton.layer.borderWidth = 1
        giveUpButton.layer.borderColor = UIColor(named: "darkGrey")?.cgColor
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    
    @IBAction func didTapPlantButton() {

        
        let selectedPickerRow = pickerView.selectedRow(inComponent: 0)
        let selectedDuration = durations[selectedPickerRow]
        
        // не превращаем минуты в секунды чтобы было проще тестировать
        let session = Session(durationInSeconds: selectedDuration, startDate: Date())
        sessionManager.startSession(session: session)
    }
    
    @IBAction func didTapGiveUp() {
        sessionManager.stopSession()
    }
    
    let durations = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return durations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(durations[row]) mins"
    }
    
    func showSessionStarted(session: Session) {
        showTimeLeft(secondsLeft: session.durationInSeconds)
        pickerView.isHidden = true
        plantButtonView.isHidden = true
        countdownLabel.isHidden = false
        giveUpButton.isHidden = false
    }
    
    func showTimeLeft(secondsLeft: Int) {
        countdownLabel.text = String(format: "%02d:%02d", secondsLeft / 60, secondsLeft % 60)
    }
    
    func showSessionEnded(session: Session) {
        performSegue(withIdentifier: "showBreakSession", sender: nil)
        pickerView.isHidden = false
        plantButtonView.isHidden = false
        countdownLabel.isHidden = true
        giveUpButton.isHidden = true
    }
    
    func userCancelledSession() {
        pickerView.isHidden = false
        plantButtonView.isHidden = false
        countdownLabel.isHidden = true
        giveUpButton.isHidden = true
    }
}

