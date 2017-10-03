//
//  ViewController.swift
//  audio_recorder
//
//  Created by EasternPeak on 10/3/17.
//  Copyright © 2017 EasternPeak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var audioRecorder : AudioRecording!
    var audioPlayer : AudioPlayback!
    var fileURL : URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fileURL = makeFileUrl()
        audioRecorder = AudioRecorder(withUrl: fileURL)
        audioPlayer = AudioPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        button.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        audioRecorder.stop()
        audioPlayer.play(byUrl: fileURL)
    }
    
    @IBAction func recordButtonDown(_ sender: Any) {
        let button = sender as! UIButton
        button.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        audioRecorder.record()
    }
    
    func makeFileUrl() -> URL {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = urls[0] as URL
        let soundURL = documentDirectory.appendingPathComponent("sound.lpcm")
        print(soundURL)
        return soundURL
    }
    
}

