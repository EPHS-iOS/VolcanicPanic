//
//  GameViewController.swift
//  VolcanicPanic
//
//  Created by 64002170 on 2/7/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
//        defaults.setValue(0, forKey: "high")
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            if let scene = MainMenu(fileNamed:"MainMenu") {
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
            
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if UIDevice.current.userInterfaceIdiom == .phone{
//                if let scene = SKScene(fileNamed:"GameScenePhone") {
//                    //                        let skView = self.view as! SKView
//                    scene.scaleMode = .aspectFit
//                    view.presentScene(scene)
//                }
//            } else {
//                if let scene = GameScene(fileNamed:"GameScenePad") {
//                    //                        let skView = self.view as! SKView
//                    scene.scaleMode = .aspectFit
//                    view.presentScene(scene)
//                }
//            }
//            //            if let scene = SKScene(fileNamed: "GameScene") {
//            //                // Set the scale mode to scale to fit the window
//            //                scene.scaleMode = .aspectFit
//            //
//            //                // Present the scene
//            //                view.presentScene(scene)
//            //            }
//            //
//            view.ignoresSiblingOrder = true
//
//            view.showsFPS = true
//            view.showsNodeCount = true
//            view.showsPhysics = true
//        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .landscape
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
