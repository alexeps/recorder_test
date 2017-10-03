//
//  AudioPlayer.swift
//  audio_recorder
//
//  Created by EasternPeak on 10/3/17.
//  Copyright © 2017 EasternPeak. All rights reserved.
//

import UIKit
import AVFoundation

final class AudioPlayer: NSObject {
    private var audioPlayer : AVAudioPlayer!

    fileprivate func playAudio(byUrl url: URL) {
        self.audioPlayer = try! AVAudioPlayer(contentsOf: url)
        self.audioPlayer.prepareToPlay()
        self.audioPlayer.delegate = self
        self.audioPlayer.play()
    }
}

extension AudioPlayer: AudioPlayback {
    func play(byUrl url: URL){
        self.playAudio(byUrl: url)
    }
}

extension AudioPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print(flag)
    }
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?){
        print(error.debugDescription)
    }
    internal func audioPlayerBeginInterruption(_ player: AVAudioPlayer){
        print(player.debugDescription)
    }

}


