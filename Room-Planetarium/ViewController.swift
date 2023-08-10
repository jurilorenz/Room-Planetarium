//
//  ViewController.swift
//  Room-Planetarium
//
//  Created by Juri Lorenz on 08.08.23.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet var switchPlanetButton: UIButton!
    
    
    
    @IBAction func switchPlanetButtonTapped(_ sender: UIButton) {
        switch currentPlanet {
        case .mercury: currentPlanet = .venus
        case .venus: currentPlanet = .earth
        case .earth: currentPlanet = .moon
        case .moon: currentPlanet = .mars
        case .mars: currentPlanet = .mercury
        }
        
        updateDisplayedPlanet()
    }
    
    var currentPlanet: PlanetType = .earth
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        sceneView.autoenablesDefaultLighting = true
        updateDisplayedPlanet()
        
        // Add a pinch gesture recognizer for zooming
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        sceneView.addGestureRecognizer(pinchGesture)
    }
    
    @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        guard let node = sceneView.scene.rootNode.childNodes.first else { return }
        
        if gesture.state == .changed {
            let pinchScale = gesture.scale
            let currentScale = node.scale
            let newScale = SCNVector3(currentScale.x * Float(pinchScale),
                                      currentScale.y * Float(pinchScale),
                                      currentScale.z * Float(pinchScale))
            
            node.scale = newScale
            gesture.scale = 1.0
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        // Cycle through planet types and update displayed planet
        switch currentPlanet {
        case .mercury: currentPlanet = .venus
        case .venus: currentPlanet = .earth
        case .earth: currentPlanet = .moon
        case .moon: currentPlanet = .mars
        case .mars: currentPlanet = .mercury
        }
        
        updateDisplayedPlanet()
    }
    
    func updateDisplayedPlanet() {
        let sphere = SCNSphere(radius: planetRadius(for: currentPlanet))
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: planetSurface(for: currentPlanet))
        sphere.materials = [material]

        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0.1, z: -20)
        node.geometry = sphere
        
        // Remove the previous planet node
        sceneView.scene.rootNode.childNodes.forEach { $0.removeFromParentNode() }
        
        sceneView.scene.rootNode.addChildNode(node)
        
        let planetName: String
        switch currentPlanet {
        case .mercury: planetName = "Mercury"
        case .venus: planetName = "Venus"
        case .earth: planetName = "Earth"
        case .moon: planetName = "Moon"
        case .mars: planetName = "Mars"
        }
        switchPlanetButton.setTitle("Switch to \(planetName)", for: .normal)
    
    }
    
    func planetRadius(for planetType: PlanetType) -> Double {
        switch planetType {
        case .mercury: return RadiusConstants.mercuryRadius
        case .venus: return RadiusConstants.venusRadius
        case .earth: return RadiusConstants.earthRadius
        case .moon: return RadiusConstants.moonRadius
        case .mars: return RadiusConstants.marsRadius
        }
    }

    func planetSurface(for planetType: PlanetType) -> String {
        switch planetType {
        case .mercury: return SurfaceConstants.mercurySurface
        case .venus: return SurfaceConstants.venusSurface
        case .earth: return SurfaceConstants.earthSurface
        case .moon: return SurfaceConstants.moonSurface
        case .mars: return SurfaceConstants.marsSurface
        }
    }
}

enum PlanetType {
    case mercury, venus, earth, moon, mars
}
