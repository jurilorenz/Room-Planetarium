//
//  PlanetariumLogic.swift
//  Room-Planetarium
//
//  Created by Juri Lorenz on 24.08.23.
//

import UIKit
import ARKit
import SceneKit
import AVFoundation


class PlanetariumLogic {
    private var player: AVAudioPlayer!
    
    // MARK: - Sound Handling
    func playSound(soundName: String) {
        // Load and play sound from file
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
    
    
    // MARK: - Button Configuration
    func configureBigButtons(_ button: UIButton, cornerRadius: CGFloat) {
        // Configure appearance of big buttons
        let backgroundColor = UIColor(red: 105/255, green: 127/255, blue: 67/255, alpha: 1)
        let tintColor = UIColor(red: 37/255, green: 58/255, blue: 113/255, alpha: 1)
        
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.tintColor = tintColor
        
        // Configure attributed title with adjusted line height
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.7
        
        let font = UIFont(name: "Chalkduster", size: 56.0) ?? UIFont.systemFont(ofSize: 56.0)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .paragraphStyle: paragraphStyle
        ]
        
        // Create an attributed string with the font and paragraph style attributes
        let attributedTitle = NSAttributedString(
            string: button.titleLabel?.text ?? "",
            attributes: attributes
        )
        button.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    func configureSmallButtons(_ button: UIButton, cornerRadius: CGFloat) {
        // Configure appearance of small buttons
        let backgroundColor = UIColor(red: 196/255, green: 197/255, blue: 194/255, alpha: 1)
        let tintColor = UIColor(red: 148/255, green: 146/255, blue: 141/255, alpha: 1)
        
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.tintColor = tintColor
    }
        
        // MARK: - Planet Display
        func updateDisplayedPlanet(on sceneView: ARSCNView, for planetType: PlanetType) {
            // Update displayed planet based on selected type
            let sphere = SCNSphere(radius: planetRadius(for: planetType))
            let material = SCNMaterial()
            material.diffuse.contents = UIImage(named: planetSurface(for: planetType))
            sphere.materials = [material]
            
            let node = SCNNode()
            node.position = SCNVector3(x: 0, y: 0.1, z: -20)
            node.geometry = sphere
            
            // Remove the previous planet node
            sceneView.scene.rootNode.childNodes.forEach { $0.removeFromParentNode() }
            
            sceneView.scene.rootNode.addChildNode(node)
        }
        
        // MARK: - Planet Properties
        func planetRadius(for planetType: PlanetType) -> Double {
            // Retrieve planet radius based on type
            switch planetType {
            case .mercury: return Planet.mercury.radius
            case .venus: return Planet.venus.radius
            case .earth: return Planet.earth.radius
            case .moon: return Planet.moon.radius
            case .mars: return Planet.mars.radius
            }
        }
        
        func planetSurface(for planetType: PlanetType) -> String {
            // Retrieve planet surface image based on type
            switch planetType {
            case .mercury: return Planet.mercury.surfaceImage
            case .venus: return Planet.venus.surfaceImage
            case .earth: return Planet.earth.surfaceImage
            case .moon: return Planet.moon.surfaceImage
            case .mars: return Planet.mars.surfaceImage
            
        }
    }
}

