//
//  AudioCore.swift
//  audio_recorder
//
//  Created by EasternPeak on 10/3/17.
//  Copyright © 2017 EasternPeak. All rights reserved.
//

import Foundation

protocol AudioRecording {
    func record()
    func stop()
}

protocol AudioPlayback {
    func play(byUrl url: URL)
}


