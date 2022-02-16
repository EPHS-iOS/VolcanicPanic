import SpriteKit
import GameplayKit

var hero: SKSpriteNode!

class GameScene: SKScene {

    
    var rightButton: SKSpriteNode!
    var leftButton: SKSpriteNode!
    var upButton: SKSpriteNode!
    var ind=0
    var floorHeight: CGFloat!
    var meteorSpawnTimer=0
    var walkSprites :[SKTexture] = [SKTexture]()
    var meteors :[Meteor] = [Meteor]()
//    var meteor=Meteor(pos: CGPoint(x: 500,y: UIScreen.main.bounds.height), siz: CGFloat(70), ang: CGFloat(0), speed: CGFloat(-3))
//    var background = SKSpriteNode(imageNamed: "background")
    
    override func didMove(to view: SKView) {
//        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
//        background.setScale(CGFloat(5))
//        background.zPosition = -100
//        self.addChild(background)
        
//        meteor=Meteor(pos: CGPoint(x: 500,y: 500), siz: CGFloat(70), ang: CGFloat(0), speed: CGFloat(-50))
//        meteor.alpha = 0.5
//        self.addChild(meteor)
        hero = (self.childNode(withName: "//hero") as! SKSpriteNode)
        rightButton = (self.childNode(withName: "//right") as! SKSpriteNode)
        leftButton = (self.childNode(withName: "//left") as! SKSpriteNode)
        upButton = (self.childNode(withName: "//up") as! SKSpriteNode)
        floorHeight = (self.childNode(withName: "//floor") as! SKSpriteNode).position.y+((self.childNode(withName: "//floor") as! SKSpriteNode).size.height)/2
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
                if (((hero.physicsBody?.velocity.dy)!<=0.2)&&((hero.physicsBody?.velocity.dy)! >= -0.2)){
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
                if ((hero.physicsBody?.velocity.dx)!>=0){
                    hero.physicsBody?.velocity=CGVector(dx: 0, dy: (hero.physicsBody?.velocity.dy)!)
                }
            }
            if (leftButton.contains(pointOfTouch)){
                if ((hero.physicsBody?.velocity.dx)!<=0){
                    hero.physicsBody?.velocity=CGVector(dx: 0, dy: (hero.physicsBody?.velocity.dy)!)
                }
            }
        }
    }

    override func update(_ currentTime: TimeInterval) {
        if (meteorSpawnTimer%60==0){
            let xVal=Int.random(in: 0..<Int(UIScreen.main.bounds.width))
            let siz=Int.random(in: 50..<200)
            let spd=Int.random(in: 1..<7)
            meteors.append(Meteor(pos: CGPoint(x: CGFloat(xVal),y: UIScreen.main.bounds.height), siz: CGFloat(siz), ang: CGFloat(0), speed: CGFloat(-1*spd)))
            meteors.last!.alpha=0.5
            meteors.last!.physicsBody=SKPhysicsBody(texture: SKTexture(imageNamed: "meteor"), alphaThreshold: 0.5, size: CGSize(width:siz,height:siz))
            meteors.last!.physicsBody?.affectedByGravity=false
            self.addChild(meteors.last!)
            meteorSpawnTimer=0
        }
        meteorSpawnTimer+=1
        if(((hero.physicsBody?.velocity.dx)! <= 1) && ((hero.physicsBody?.velocity.dx)! >= -1)){
            hero.physicsBody?.velocity.dx = 0
        }
        for m in meteors{
            m.update()
            if (m.physicsBody != nil){
                for body in (m.physicsBody!.allContactedBodies()){
                    if body==hero.physicsBody{
                        hero.removeFromParent()
                    }
                }
            }
            if (m.position.y-(m.size.height/2)<floorHeight){
                m.removeFromParent()
            }
        }
//        meteor.update()
//        if (meteor.position.y-(meteor.size.height/2)<floorHeight){
//            meteor.removeFromParent()
//        }
//        print(hero.physicsBody?.velocity.dy)
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
    }
}
