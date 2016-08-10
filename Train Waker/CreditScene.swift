//
//  CreditScene.swift
//  Train Waker
//
//  Created by Jenny Kim on 8/9/16.
//  Copyright © 2016 Jenny Kim. All rights reserved.
//

import Foundation
import Foundation
import SpriteKit

class CreditScene: SKReferenceNode{
    
    var creditExitButton: MSButtonNode!
    
    override func didLoadReferenceNode(node: SKNode?) {
        
        
        creditExitButton = childNodeWithName("//creditExitButton") as! MSButtonNode
        let gameManager = UserState.sharedInstance
        
        creditExitButton.selectedHandler = {
            
            if gameManager.lastScene == "startMenu"{
                self.hidden = true
            }
            
        }
        
    }
    
    
    
}
