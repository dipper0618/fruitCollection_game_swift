//
//  GameplaySceneClass.swift
//  game
//
//  Created by ling on 22/2/2018.
//  Copyright © 2018年 ling. All rights reserved.
//

import SpriteKit

class GameplaySceneClass: SKScene, SKPhysicsContactDelegate{
    private var player: Player?;
     
    private var center = CGFloat();
     
    private var canMove = false, moveLeft = false;
    private var itemController = ItemConroller();
    private var scoreLabel: SKLabelNode?;
    private var score = 0;
    
    
     override func didMove(to view: SKView) {
     initializeGame();
     }
     
     override func update(_ currentTime: TimeInterval) {
     managePlayer();
     }

     
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     for touch in touches {
     let location = touch.location(in: self);
     if location.x > center{
     moveLeft = false;
     } else {
     moveLeft = true;
     
     }
     
     }
     canMove = true;
     
     }
     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     canMove = false;
     
     }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody();
        var secondBody = SKPhysicsBody();
        
        if contact.bodyA.node?.name == "Player" {
            firstBody = contact.bodyA;
            secondBody = contact.bodyB;
            
        }else{
            firstBody = contact.bodyB;
            secondBody = contact.bodyA;
        }
        
        if firstBody.node?.name == "Player" && secondBody.node?.name == "Fish" {
            score += 1;
            scoreLabel?.text = String(score);
            secondBody.node?.removeFromParent();
            
        }
        if firstBody.node?.name == "Player" && secondBody.node?.name == "Star" {
            firstBody.node?.removeFromParent();
            secondBody.node?.removeFromParent();
            
          /*  Timer.scheduledTimer(timeInterval: TimeInterval(2),target: self, selector: #selector(GameplaySceneClass.restartGame),userInfo: nil, repeats: false);
             */
            
        }
    }
    
    
    private func initializeGame(){
        physicsWorld.contactDelegate = self;
        player = childNode(withName: "Player") as? Player!;
        player?.initializePlayer();
        
        scoreLabel = childNode(withName: "scoreLabel") as?SKLabelNode!;
        scoreLabel?.text = "0";
         
        center = self.frame.size.width / self.frame.size.height;
        
        Timer.scheduledTimer(timeInterval: TimeInterval(itemController.randomBetweenNumbers(firstNum: 0.1,secondNum: 0.2)),target: self, selector: #selector(GameplaySceneClass.spwanItem), userInfo: nil, repeats: true);
        
    }
    
    
     
     private func managePlayer(){
         if canMove {
         player?.move(left: moveLeft);
         }
     }
    @objc
     func spwanItem(){
        self.scene?.addChild(itemController.spawnItem());
        
    }
    
   /* @objc func restartGame(){
        if let scene = GameplaySceneClass(fileNamed:"GameplayScene"){
            scene.scaleMode = .aspectFill
            view?.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)))
            
        }
        
    }*/
}

































