//
//  PlanetariumLogic.swift
//  Room-Planetarium
//
//  Created by Juri Lorenz on 24.08.23.
//

import AVFoundation

class PlanetariumLogic {
    private var player: AVAudioPlayer!
    
    func playSound(soundName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundName, withExtension: "wav") else {
            print("Sound file not found: \(soundName)")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            player.prepareToPlay()
            player.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

