//
//  AudioRecorder.swift
//  audio_recorder
//
//  Created by EasternPeak on 10/3/17.
//  Copyright © 2017 EasternPeak. All rights reserved.
//

import UIKit
import AVFoundation

final class AudioRecorder: NSObject, AVAudioRecorderDelegate {
    private var recordingSession : AVAudioSession!
    private var audioRecorder : AVAudioRecorder!
    private var settings = [String : Int]()
    
    init(withUrl url:URL) {
        super.init()
        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                if allowed {
                    self.setUpAudioRecorder(withUrl: url)
                }
            }
        } catch {
            print("failed to record!")
        }
        
        settings = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
    }
    
    private func setUpAudioRecorder(withUrl url:URL) {
        do {
            self.audioRecorder = try AVAudioRecorder(url: url,
                                                settings: self.settings)
            self.audioRecorder.delegate = self
            self.audioRecorder.prepareToRecord()
        } catch {
            self.finishRecording(success: false)
        }
    }
    
    fileprivate func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        do { 
            try audioSession.setActive(true)
            audioRecorder.record()
        } catch {
        }
    }
    
    fileprivate func finishRecording(success: Bool) {
        audioRecorder.stop()
        if success {
            print(success)
        } else {
            audioRecorder = nil
            print("Somthing Wrong.")
        }
    }
}

extension AudioRecorder : AudioRecording {
    func record() {
        startRecording()
    }
    
    func stop() {
        finishRecording(success: true)
    }
}
