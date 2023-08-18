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
    
    @IBOutlet var planetLabel: UILabel!
    
    @IBOutlet var aboutText: UITextView!
    
    @IBOutlet weak var bigRight: UIButton!
    
    @IBOutlet weak var bigLeft: UIButton!
    
    @IBOutlet weak var smallRight: UIButton!
    
    @IBOutlet weak var smallLeft: UIButton!
    
    var currentFactIndex: Int = 0
    
    @IBAction func aboutButtonTapped(_ sender: UIButton) {
        aboutText.alpha = 1
        let facts = PlanetFacts.facts(for: currentPlanet)
        if currentFactIndex < facts.count {
            aboutText.text = facts[currentFactIndex]
            currentFactIndex += 1
        } else {
            currentFactIndex = 0
            aboutText.text = facts.first
        }
    }
    
    @IBAction func switchPlanetButtonTapped(_ sender: UIButton) {
        switch currentPlanet {
        case .mercury: currentPlanet = .venus
        case .venus: currentPlanet = .earth
        case .earth: currentPlanet = .moon
        case .moon: currentPlanet = .mars
        case .mars: currentPlanet = .mercury
        }
        aboutText.alpha = 0
        updateDisplayedPlanet()
    }
    
    var currentPlanet: PlanetType = .earth
    var lastPanLocation: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBigButtons(bigRight, cornerRadius: 25.0)
        configureBigButtons(bigLeft, cornerRadius: 25.0)
        configureSmallButtons(smallRight, cornerRadius: 25.0)
        configureSmallButtons(smallLeft, cornerRadius: 25.0)
        
        // Set the view's delegate
        sceneView.delegate = self
        
        sceneView.autoenablesDefaultLighting = true
        updateDisplayedPlanet()
        
        // Add a pinch gesture recognizer for zooming
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        sceneView.addGestureRecognizer(pinchGesture)
        
        // Add a pan gesture recognizer for rotation
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        sceneView.addGestureRecognizer(panGesture)

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

    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let node = sceneView.scene.rootNode.childNodes.first else { return }

        if gesture.state == .changed {
            let location = gesture.location(in: sceneView)
            if let lastLocation = lastPanLocation {
                let deltaX = Float(location.x - lastLocation.x)
                let deltaY = Float(location.y - lastLocation.y)
                
                // Adjust the rotation angles based on gesture movement
                node.eulerAngles.y -= deltaX * 0.01
                node.eulerAngles.x -= deltaY * 0.01
                
                // Limit vertical rotation to avoid flipping
                let minVerticalAngle: Float = -Float.pi / 2.0
                let maxVerticalAngle: Float = Float.pi / 2.0
                node.eulerAngles.x = max(min(node.eulerAngles.x, maxVerticalAngle), minVerticalAngle)
            }
            lastPanLocation = location
        } else if gesture.state == .ended {
            lastPanLocation = nil
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
    
    func configureBigButtons(_ button: UIButton, cornerRadius: CGFloat) {
        let backgroundColor = UIColor(red: 105/255, green: 127/255, blue: 67/255, alpha: 1)
        let tintColor = UIColor(red: 37/255, green: 58/255, blue: 113/255, alpha: 1)
        
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.tintColor = tintColor
        
        // Create a paragraph style with the desired line height multiple
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.7
        
        // Create attributes for the font and paragraph style
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
        let backgroundColor = UIColor(red: 196/255, green: 197/255, blue: 194/255, alpha: 1)
        let tintColor = UIColor(red: 148/255, green: 146/255, blue: 141/255, alpha: 1)
        
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.tintColor = tintColor
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
        planetLabel.text = planetName
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

