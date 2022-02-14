//
//  Meteor.swift
//  VolcanicPanic
//
//  Created by 64002170 on 2/11/22.
//

import Foundation
import SpriteKit

class Meteor: SKSpriteNode{
    var sp:CGFloat
    
    init(pos: CGPoint, siz: CGFloat, ang: CGFloat, speed:CGFloat){
        sp=speed
        super.init(texture: SKTexture(imageNamed: "meteor"), color: UIColor.clear, size: CGSize(width: siz, height: siz))
        position=pos
        zRotation=ang
        physicsBody?.affectedByGravity=false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(){
        position.y += sp
        zRotation += 3.14/64
    }
    
}
