//
//  HelpScene.swift
//  Train Waker
//
//  Created by Jenny Kim on 8/1/16.
//  Copyright © 2016 Jenny Kim. All rights reserved.
//

import Foundation
import SpriteKit

class HelpScene: SKReferenceNode{
    
    var helpExitButton: MSButtonNode!
    
    override func didLoadReferenceNode(node: SKNode?) {
    
        
        helpExitButton = childNodeWithName("//helpExitButton") as! MSButtonNode
        let gameManager = UserState.sharedInstance

        helpExitButton.selectedHandler = {
           
            
            if gameManager.lastScene == "gameScene"{
                
                if gameManager.pause == true{
                    state = .Paused
                }
                else {state = .Playing}
                self.hidden = true
                
            }
            
              else if gameManager.lastScene == "startMenu"{
               self.hidden = true
            }
            
        }
    
    }
    
    
    
}
