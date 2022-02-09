import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var hero: SKSpriteNode!
    var rightButton: SKSpriteNode!
    var leftButton: SKSpriteNode!
    var ind=0
    var walkSprites :[SKTexture] = [SKTexture]()
    
    override func didMove(to view: SKView) {
        hero = (self.childNode(withName: "//hero") as! SKSpriteNode)
        rightButton = (self.childNode(withName: "//right") as! SKSpriteNode)
        leftButton = (self.childNode(withName: "//left") as! SKSpriteNode)
        
        walkSprites.append(SKTexture(imageNamed: "walk0"))
        walkSprites.append(SKTexture(imageNamed: "walk1"))
        walkSprites.append(SKTexture(imageNamed: "walk2"))
        walkSprites.append(SKTexture(imageNamed: "walk3"))
        walkSprites.append(SKTexture(imageNamed: "walk4"))
        walkSprites.append(SKTexture(imageNamed: "walk5"))
        walkSprites.append(SKTexture(imageNamed: "walk6"))
        walkSprites.append(SKTexture(imageNamed: "walk7"))
        
        hero.isPaused = true
        rightButton.isPaused = true
        leftButton.isPaused = true
        hero.isPaused = false
        rightButton.isPaused = false
        leftButton.isPaused = false
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
