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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let sphere = SCNSphere(radius: 0.2)
        
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: "art.scnassets/venus_surface.jpg")
        
        sphere.materials = [material]
        
        let node = SCNNode()
        
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        
        node.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(node)
        
        sceneView.autoenablesDefaultLighting = true
        
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
}
