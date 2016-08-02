//
//  HelpScene.swift
//  Train Waker
//
//  Created by Jenny Kim on 8/1/16.
//  Copyright © 2016 Jenny Kim. All rights reserved.
//

import Foundation
import SpriteKit

class HelpScene: SKScene{
    
    var helpExitButton: MSButtonNode!
    
    override func didMoveToView(view: SKView) {
    helpExitButton = childNodeWithName("helpExitButton") as! MSButtonNode
        let gameManager = UserState.sharedInstance

        helpExitButton.selectedHandler = {
           
            
            if gameManager.lastScene == "gameScene"{
                
                state = .Playing
                /* Grab reference to our SpriteKit view */
//                let skView = self.view as SKView!
//                
//                /* Load Game scene */
//                let scene = GameScene(fileNamed:"GameScene") as GameScene!
//                
//                /* Ensure correct aspect mode */
//                scene.scaleMode = .AspectFill
//                
//                state = .Playing
//                
////                /* Restart game scene */
////                skView.presentScene(scene)
            }
            
              else if gameManager.lastScene == "startMenu"{
                /* Grab reference to our SpriteKit view */
                let skView = self.view as SKView!
                
                /* Load Game scene */
                let scene = StartMenu(fileNamed:"StartMenu") as StartMenu!
                /* Ensure correct aspect mode */
                scene.scaleMode = .AspectFill
                
                /* Show debug */
                skView.showsPhysics = true
                skView.showsDrawCount = true
                skView.showsFPS = true
                
                /* Start game scene */
                skView.presentScene(scene)
            }
            
        }
    
    }
    
    
    
}
