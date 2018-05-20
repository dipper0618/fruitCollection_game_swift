//
//  MainMeunScene.swift
//  game
//
//  Created by ling on 22/2/2018.
//  Copyright © 2018年 ling. All rights reserved.
//

import SpriteKit

class MainMeunScene: SKScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self);
            
            if atPoint(location).name == "Start"{
                if let scene = GameplaySceneClass(fileNamed: "GameplayScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)));
                    
                }
                
            }
            
        }
    }
    
}

