import SpriteKit
import GameplayKit

var hero: SKSpriteNode!

class GameScene: SKScene {

    
    var rightButton: SKSpriteNode!
    var leftButton: SKSpriteNode!
    var upButton: SKSpriteNode!
    var ind=0
    var walkSprites :[SKTexture] = [SKTexture]()
//    var background = SKSpriteNode(imageNamed: "background")
    
    override func didMove(to view: SKView) {
//        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
//        background.setScale(CGFloat(5))
//        background.zPosition = -100
//        self.addChild(background)
        hero = (self.childNode(withName: "//hero") as! SKSpriteNode)
        rightButton = (self.childNode(withName: "//right") as! SKSpriteNode)
        leftButton = (self.childNode(withName: "//left") as! SKSpriteNode)
        upButton = (self.childNode(withName: "//up") as! SKSpriteNode)
        
        walkSprites.append(SKTexture(imageNamed: "walk0"))
        walkSprites.append(SKTexture(imageNamed: "walk1"))
        walkSprites.append(SKTexture(imageNamed: "walk2"))
        walkSprites.append(SKTexture(imageNamed: "walk3"))
        walkSprites.append(SKTexture(imageNamed: "walk4"))
        walkSprites.append(SKTexture(imageNamed: "walk5"))
        walkSprites.append(SKTexture(imageNamed: "walk6"))
        walkSprites.append(SKTexture(imageNamed: "walk7"))
        
//        hero.isPaused = true
//        rightButton.isPaused = true
//        leftButton.isPaused = true
//        hero.isPaused = false
//        rightButton.isPaused = false
//        leftButton.isPaused = false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        for touch in touches {
            let pointOfTouch=touch.location(in: self)
            if (rightButton.contains(pointOfTouch)){
                hero.xScale = 1
                hero.physicsBody?.velocity=CGVector(dx: 200, dy: (hero.physicsBody?.velocity.dy)!)
            }
            if (leftButton.contains(pointOfTouch)){
                hero.xScale = -1
                hero.physicsBody?.velocity=CGVector(dx: -200, dy: (hero.physicsBody?.velocity.dy)!)
            }
            if (upButton.contains(pointOfTouch)){
                if (((hero.physicsBody?.velocity.dy)!<=0.1)&&((hero.physicsBody?.velocity.dy)! >= -0.1)){
                    hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 900))
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch ends */
        for touch in touches {
            let pointOfTouch=touch.location(in: self)
            if (rightButton.contains(pointOfTouch)){
                hero.physicsBody?.velocity=CGVector(dx: 0, dy: 0)
            }
            if (leftButton.contains(pointOfTouch)){
                hero.physicsBody?.velocity=CGVector(dx: 0, dy: 0)
            }
        }
    }

    override func update(_ currentTime: TimeInterval) {
        if(((hero.physicsBody?.velocity.dx)! <= 1) && ((hero.physicsBody?.velocity.dx)! >= -1)){
            hero.physicsBody?.velocity.dx = 0
        }
        /* Called before each frame is rendered */
        if(hero.physicsBody?.velocity.dx == 0){
            ind=0
            hero.texture = walkSprites[(ind-(ind%4))/4]
        } else {
            if ind>39{
                ind=0
            }
            hero.texture = walkSprites[(ind-(ind%5))/5]
            ind+=1
        }
        
//         /* Grab current velocity */
//        let velocityY = hero.physicsBody?.velocity.dy ?? 0
//
//         /* Check and cap vertical velocity */
//         if velocityY > 400 {
//             hero.physicsBody?.velocity.dy = 400
//         }
    }
}
