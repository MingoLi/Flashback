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

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var taskTextField: UITextField!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
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
        
        // Save the data to coredata
        Persistence.saveContext()
        
//        let _ = navigationController?.popViewController(animated: true)
    }
    
    
}

