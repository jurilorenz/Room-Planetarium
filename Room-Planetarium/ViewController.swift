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
    
    var currentPlanet: PlanetType = .earth
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        sceneView.autoenablesDefaultLighting = true
        updateDisplayedPlanet()
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
        case .mars: currentPlanet = .jupiter
        case .jupiter: currentPlanet = .neptune
        case .neptune: currentPlanet = .uranus
        case .uranus: currentPlanet = .mercury
        }
        
        updateDisplayedPlanet()
    }
    
    func updateDisplayedPlanet() {
        let sphere = SCNSphere(radius: planetRadius(for: currentPlanet))
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: planetSurface(for: currentPlanet))
        sphere.materials = [material]

        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0.1, z: -100)
        node.geometry = sphere
        
        // Remove the previous planet node
        sceneView.scene.rootNode.childNodes.forEach { $0.removeFromParentNode() }
        
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    func planetRadius(for planetType: PlanetType) -> Double {
        switch planetType {
        case .mercury: return RadiusConstants.mercuryRadius
        case .venus: return RadiusConstants.venusRadius
        case .earth: return RadiusConstants.earthRadius
        case .moon: return RadiusConstants.moonRadius
        case .mars: return RadiusConstants.marsRadius
        case .jupiter: return RadiusConstants.jupiterRadius
        case .neptune: return RadiusConstants.neptuneRadius
        case .uranus: return RadiusConstants.uranusRadius
        }
    }

    func planetSurface(for planetType: PlanetType) -> String {
        switch planetType {
        case .mercury: return SurfaceConstants.mercurySurface
        case .venus: return SurfaceConstants.venusSurface
        case .earth: return SurfaceConstants.earthSurface
        case .moon: return SurfaceConstants.moonSurface
        case .mars: return SurfaceConstants.marsSurface
        case .jupiter: return SurfaceConstants.jupiterSurface
        case .neptune: return SurfaceConstants.neptuneSurface
        case .uranus: return SurfaceConstants.uranusSurface
        }
    }
}

enum PlanetType {
    case mercury, venus, earth, moon, mars, jupiter, neptune, uranus
}
