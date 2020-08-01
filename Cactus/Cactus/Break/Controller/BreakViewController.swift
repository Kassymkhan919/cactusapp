//
//  BreakViewController.swift
//  Cactus
//
//  Created by kasymhan on 7/29/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import UIKit

class BreakViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, BreakManagerDelegate {
    
    lazy var breakManager = BreakManager(breakDelegate: self)
    
    
    @IBOutlet var finishBreakButton: UIButton!
    @IBOutlet var takeBreakButtonView: UIButton!
    @IBOutlet var cactusImageView: UIImageView!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var countdownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       cactusImageView.layer.cornerRadius = cactusImageView.frame.width / 2
    cactusImageView.layer.masksToBounds = true
        
        takeBreakButtonView.layer.cornerRadius = 14
        takeBreakButtonView.layer.masksToBounds = true
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
       
        finishBreakButton.layer.cornerRadius = 14
        finishBreakButton.layer.masksToBounds = true
        
    finishBreakButton.layer.borderWidth = 1
       
    finishBreakButton.layer.borderColor = UIColor(named: "darkGrey")?.cgColor
    }
    
    @IBAction func didTapCloseButton() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    let durations = [5, 10, 15, 20, 25, 30]
    
    // number of rows
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // number of choices in picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return durations.count
    }
    
    // content of picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(durations[row]) mins"
    }
    
    
    func breakDidStart(aBreak: Break) {
        showBreakTimeLeft(secondsLeft: aBreak.durationInSeconds)
        pickerView.isHidden = true
        takeBreakButtonView.isHidden = true
        countdownLabel.isHidden = false
        finishBreakButton.isHidden = false
    }
    
    func breakEnded(aBreak: Break) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func showBreakTimeLeft(secondsLeft: Int) {
        countdownLabel.text = String(format:"%02d:%02d", secondsLeft / 60, secondsLeft % 60)
    }
    
    func breakDidCancel() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapTakeBreakButton() {
        let selectedPickerRow = pickerView.selectedRow(inComponent: 0)
        let selectedDuration = durations[selectedPickerRow]
        let abreak = Break(durationInSeconds: selectedDuration)
       
        breakManager.startBreak(aBreak: abreak)
    }

   @IBAction func didTapFinishButton() {
       presentingViewController?.dismiss(animated: true, completion: nil)
   }
   
}
