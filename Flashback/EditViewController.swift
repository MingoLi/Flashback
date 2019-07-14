//
//  EditViewController.swift
//  Flashback
//
//  Created by Mingo on 2019-07-04.
//  Copyright © 2019 Mingo. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class EditViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var taskTextField: UITextView!
    
    // Button Group used for selecting category
    @IBOutlet weak var catDefault: UIButton!
    @IBOutlet weak var catGreen: UIButton!
    @IBOutlet weak var catOrange: UIButton!
    @IBOutlet weak var catRed: UIButton!
    @IBOutlet weak var catBlue: UIButton!
    @IBOutlet weak var catPurple: UIButton!
    var buttonArray: [UIButton]!
    
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Init button group array
        buttonArray = [catDefault, catGreen, catOrange, catRed,  catBlue, catPurple]
        
    }

    @IBAction func recordButtonPressed(_ sender: Any) {
        if(recordingLabel.text == Strings.TapToRecord) {
            recordButton.setImage(UIImage(named: "RecordingButton"), for: .normal)
            recordingLabel.text = Strings.RecordingInProgress
            startRecord()
            
        } else {
            recordButton.setImage(UIImage(named: "RecordButton"), for: .normal)
            recordingLabel.text = Strings.TapToRecord
            stopRecord()
        }
    }
    
    //   TODO: add clear record button
    
    func startRecord() {
        print("record was called")
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        try! AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, options: [])
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func stopRecord() {
        print("stopRecord triggered")
        // TODO: should I resume the record or clear and restart
        audioRecorder.stop()
        try! AVAudioSession.sharedInstance().setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            print("audio finish recording")
        } else {
            print("record was not sucessful")
        }
    }
    
    @IBAction func onSavePressed(_ sender: Any) {
        print("save pressed")
        
        let task = Task(context: Persistence.context)
        task.content = taskTextField.text!
        task.date = Date()
        task.category = whichCategory()
        
        // Save the data to coredata
        Persistence.saveContext()
        TaskDataClass.sharedInstance.appendNewTask(task: task)
        
//        let _ = navigationController?.popViewController(animated: true)
    }
    
    // Button group actions
    func unselectAllButtons() {
        for b in buttonArray {
            b.isSelected = false
            // TODO: trigger animation if necessary
        }
    }
    
    func whichCategory() -> Int16 {
        for (i, b) in buttonArray.enumerated() {
            if b.isSelected {
                return TaskCategory.allCases[i].rawValue
            }
        }
        return TaskCategory.defaultCat.rawValue
    }
    
    @IBAction func onCatDefaultPressed(_ sender: UIButton) {
        print("default pressed")
        if !sender.isSelected {
            unselectAllButtons()
            catDefault.isSelected = true
        }
         
    }
    
    @IBAction func onCatGreenPressed(_ sender: UIButton) {
        print("green pressed")
        if !sender.isSelected {
            unselectAllButtons()
            catGreen.isSelected = true
        }
    }
    
}

