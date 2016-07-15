//
//  WaitLight.swift
//  Train Waker
//
//  Created by Jenny Kim on 7/13/16.
//  Copyright © 2016 Jenny Kim. All rights reserved.
//

import Foundation
import SpriteKit


class WaitLight{
    

    let scene: GameScene!
    var timerXPosition: Int = 0
    var waitLightXPos: Int = 0
    var waitLight2XPos: Int = 0
    var waitLight3XPos: Int = 0
    var waitLight4XPos: Int = 0
    var timerWidth: Int = 0
    
    
    init (scene1: AnyObject!){
        scene = scene1 as! GameScene
        timerXPosition = Int(scene.timerBar.position.x)
        waitLightXPos = Int(scene.waitLight.position.x)
        waitLight2XPos = Int(scene.waitLight2.position.x)
        waitLight3XPos = Int(scene.waitLight3.position.x)
        waitLight4XPos = Int(scene.waitLight4.position.x)
        timerWidth = Int(scene.timerBar.size.width)
    }
    
    //Allows dots to light up on countdown bar
    func turnOnWaitLight(){
        
        if timerXPosition + timerWidth <=  waitLightXPos && timerXPosition + timerWidth > waitLight2XPos {
            scene.waitLight.hidden = false
        
        }
        if timerXPosition + timerWidth <=  waitLight2XPos && timerXPosition + timerWidth > waitLight3XPos {
            scene.waitLight2.hidden = false
            
        }
        if timerXPosition + timerWidth <=  waitLight3XPos && timerXPosition + timerWidth > waitLight4XPos {
            scene.waitLight3.hidden = false

            
        }
        if timerXPosition + timerWidth <=  waitLight4XPos{
            scene.waitLight4.hidden = false
            
        }
    }
    
    
    
    
    
    
}



