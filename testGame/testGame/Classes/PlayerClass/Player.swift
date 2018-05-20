//
//  Player.swift
//  game
//
//  Created by ling on 22/2/2018.
//  Copyright © 2018年 ling. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode{
    
    private var minX = CGFloat(-300), maxX = CGFloat(250);
    
    func initializePlayer(){
        name = "Player";
        physicsBody = SKPhysicsBody(circleOfRadius : size.height/2);
        physicsBody?.affectedByGravity = false;
        physicsBody?.isDynamic = false;
        physicsBody?.categoryBitMask = ColliderType.PLAYER;
        physicsBody?.contactTestBitMask = ColliderType.STAR_AND_FISH;
        
    }
     func move(left: Bool) {
     if left{
     
     position.x -= 15;
        if position.x < minX{
            position.x = minX;
        }
     
     }else{
     
     position.x += 15;
        if position.x > maxX{
            position.x = maxX;
        }
     }
     }
}




