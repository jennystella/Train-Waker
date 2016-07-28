//
//  TrainLight.swift
//  Train Waker
//
//  Created by Jenny Kim on 7/28/16.
//  Copyright © 2016 Jenny Kim. All rights reserved.
//

import Foundation
import SpriteKit


class TrainLight{
    
    
    let scene: GameScene!
    var trainLightOGWidth: Float
    var trainLightWidth: Float
    
    
    
    init (scene1: AnyObject!){
        scene = scene1 as! GameScene
        trainLightOGWidth = Float(scene.trainLightBase.size.width)
        trainLightWidth = Float(scene.trainLight.size.width)
        
    }
    
    
//    func colorChange(){
//        let calculate1: Float = Float(trainLightOGWidth * (2.0/3))
//        let calculate2: Float = Float(trainLightOGWidth * (1.0/3))
//
//        if trainLightWidth > calculate1 && !changedToGreen {
//            changedToGreen = true
//            let action1 = SKAction.colorizeWithColor(UIColor.greenColor(), colorBlendFactor: 0, duration: 0.5)
//            let waitAction = SKAction.waitForDuration(0.5)
//            let recolor1 = SKAction.sequence([action1, waitAction])
//            scene.trainLight.runAction(recolor1)
//            
//
//        }
//        
//        if trainLightWidth > calculate2 && trainLightWidth < calculate1 && !changedToYellow{
//            let action2 = SKAction.colorizeWithColor(UIColor.yellowColor(), colorBlendFactor: 0, duration: 0.5)
//            let waitAction = SKAction.waitForDuration(0.5)
//            let recolor2 = SKAction.sequence([action2, waitAction])
//            scene.trainLight.runAction(recolor2)
//            changedToYellow = true
//        }
//        
//        if trainLightWidth > 0 && trainLightWidth < calculate2 && !changedToRed {
//            let action3 = SKAction.colorizeWithColor(UIColor.redColor(), colorBlendFactor: 0, duration: 0.5)
//            let waitAction = SKAction.waitForDuration(0.5)
//            let recolor3 = SKAction.sequence([action3, waitAction])
//            scene.trainLight.runAction(recolor3)
//            changedToRed = true
//        }
//        
//        
//    }
    
}

