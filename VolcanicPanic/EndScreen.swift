//
//  EndScreen.swift
//  VolcanicPanic
//
//  Created by 64002170 on 2/16/22.
//

import SpriteKit

class EndScreen: SKScene {

    var play: SKLabelNode!
    var title1: SKLabelNode!
    var scoreL: SKLabelNode!
    var highScoreL: SKLabelNode!
    

    override func didMove(to view: SKView) {
//        print(self.frame.width)
//        print(UIScreen.main.bounds.width)
        let middle=self.frame.width/2
        play = (self.childNode(withName: "play") as! SKLabelNode)
        title1 = (self.childNode(withName: "title1") as! SKLabelNode)
        scoreL = (self.childNode(withName: "score") as! SKLabelNode)
        highScoreL = (self.childNode(withName: "highScore") as! SKLabelNode)
        highScoreL.text = "High Score: "+String(defaults.integer(forKey: "high"))
        scoreL.text="Score: "+String(score)
        scoreL.position.x=middle
        scoreL.position.y=4*self.frame.height/6
        highScoreL.position.x=middle
        highScoreL.position.y=3*self.frame.height/6
        play.position.x=middle
        play.position.y=self.frame.height/4
        title1.position.x=middle
        title1.position.y=5*self.frame.height/6

        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let pointOfTouch=touch.location(in: self)
            if (play.contains(pointOfTouch)){
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if UIDevice.current.userInterfaceIdiom == .phone{
                        if let scene = SKScene(fileNamed:"GameScenePhone") {
                            //                        let skView = self.view as! SKView
                            scene.scaleMode = .aspectFit
                            view.presentScene(scene)
                        }
                    } else {
                        if let scene = GameScene(fileNamed:"GameScenePad") {
                            //                        let skView = self.view as! SKView
                            scene.scaleMode = .aspectFit
                            view.presentScene(scene)
                        }
                    }
                    //            if let scene = SKScene(fileNamed: "GameScene") {
                    //                // Set the scale mode to scale to fit the window
                    //                scene.scaleMode = .aspectFit
                    //
                    //                // Present the scene
                    //                view.presentScene(scene)
                    //            }
                    //
                    view.ignoresSiblingOrder = true
                    
//                    view.showsFPS = true
//                    view.showsNodeCount = true
//                    view.showsPhysics = true
                }
            }
        }
    }
}





