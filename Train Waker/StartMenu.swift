//
//  StartMenu.swift
//  Train Waker
//
//  Created by Jenny Kim on 7/26/16.
//  Copyright © 2016 Jenny Kim. All rights reserved.
//

import Foundation
import SpriteKit



class StartMenu: SKScene {
    
    /* UI Connections */
    var startButton: MSButtonNode!
    var startMenuTitle: SKLabelNode!
    var helpButton: MSButtonNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        /* Set UI connections */
        startButton = self.childNodeWithName("startButton") as! MSButtonNode
        helpButton = self.childNodeWithName("helpButton") as! MSButtonNode
        startMenuTitle = self.childNodeWithName("startMenuTitle") as! SKLabelNode
       
        let gameManager = UserState.sharedInstance
        gameManager.lastScene = "startMenu"

        /* Setup restart button selection handler */
        startButton.selectedHandler = {
            
            /* Grab reference to our SpriteKit view */
            let skView = self.view as SKView!
            
            /* Load Game scene */
            let scene = GameScene(fileNamed:"GameScene") as GameScene!
            
            /* Ensure correct aspect mode */
            scene.scaleMode = .AspectFill

            /* Start game scene */
            skView.presentScene(scene)
        }
        
        helpButton.selectedHandler = {
            
            /* Grab reference to our SpriteKit view */
            let skView = self.view as SKView!
            
            /* Load Game scene */
            let scene = HelpScene(fileNamed:"HelpScene") as HelpScene!
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
