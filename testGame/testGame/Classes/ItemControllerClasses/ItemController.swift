//
//  ItemController.swift
//  testGame
//
//  Created by ling on 22/2/2018.
//  Copyright © 2018年 ling. All rights reserved.
//

import SpriteKit

struct ColliderType{
    static let PLAYER: UInt32 = 0;
    static let STAR_AND_FISH: UInt32 = 1;
}

class ItemConroller {
    private var minX = CGFloat(-300), maxX = CGFloat(250);

    
    func spawnItem() -> SKSpriteNode{
        let item: SKSpriteNode?;
        if Int(randomBetweenNumbers(firstNum: 0, secondNum: 10)) > 6 {
            item = SKSpriteNode(imageNamed: "star");
            item!.name = "Star";
            item!.setScale(1);
            item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2);
            
        } else {
            let num = Int(randomBetweenNumbers(firstNum: 1, secondNum: 8));
            item = SKSpriteNode(imageNamed:"fruit \(num)" );
            item!.name = "Fish";
            item!.setScale(0.5);
            item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2);

        }
        item!.physicsBody?.categoryBitMask = ColliderType.STAR_AND_FISH;
        item!.zPosition = 3;
        item!.anchorPoint = CGPoint(x: 0.5, y:0.5);
        item!.position.x = randomBetweenNumbers(firstNum: minX, secondNum: maxX);
        item!.position.y = 500;
        
        
        return item!;
        
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) * min(firstNum, secondNum);
        
    }
}







