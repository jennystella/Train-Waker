//
//  GameScene.swift
//  Train Waker
//
//  Created by Jenny Kim on 7/11/16.
//  Copyright (c) 2016 Jenny Kim. All rights reserved.
//

import SpriteKit

enum gameState {
    case Title, Ready, Playing, GameOver
}

class GameScene: SKScene {
    
    var trainLight: SKSpriteNode!
    let fixedDelta: CFTimeInterval = 1.0/60.0 /* 60 FPS */
    
    //This is for the timer countdown of the train light
    var timerBar: SKSpriteNode!
    var timer: CGFloat = 1.0{
        didSet{
            /* Cap timer */
            if timer > 1.0 { timer = 1.0 }
            timerBar.xScale = timer
        }
    }
    var state: gameState = .Title
    
    var keepTimerOnTrack: Int = 1




    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        trainLight = childNodeWithName("trainLight") as! SKSpriteNode
        timerBar = childNodeWithName("timerBar") as! SKSpriteNode
        
        self.state = .Ready
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        /*Game will not continue if it is game over
        
        NOTE: Consider getting rid of the .Title state, unless start menu is created in which case, make sure the start menu is in the state of .Title  */
        if state == .GameOver || state == .Title { return }
        
        
        //Basically, if the game is ready to start, it will continue and become playable
        if state == .Ready {
            state = .Playing
            
        }

    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered*/
         
         
        /* Basically if it's game over or the start menu, then the timer countdown will not start to decrease*/
        if state != .Playing { return }
        
        /* Decreases the timer each time the program goes through the update function */
        timer -= 0.01
        
        print(timer)
        
        
        //This if statement will make the train light change colors and reset the timer when the var "keepTimerOnTrack" is 1 and the timer is between 0 to -0.01
        if keepTimerOnTrack == 1 && timer < 0  && timer > -0.01{
            
            timerBar.hidden = true
            
            let action = SKAction.colorizeWithColor(UIColor.greenColor(), colorBlendFactor: 0, duration: 1)
            let action1 = SKAction.colorizeWithColor(UIColor.yellowColor(), colorBlendFactor: 0, duration: 1)
            let action2 = SKAction.colorizeWithColor(UIColor.grayColor(), colorBlendFactor: 0, duration: 1)
            let waitAction = SKAction.waitForDuration(1)

            let recolor = SKAction.sequence([action, waitAction, action1, waitAction, action2, waitAction])
            self.trainLight.runAction(recolor, completion: { 
                self.keepTimerOnTrack -= 1
                self.timer = 1.0
                self.timerBar.hidden = false
            })
            
            
            
            keepTimerOnTrack += 1
        }

        
        
    }
    
    
        
        
}
    
    

    
    
    
    
    
    
    
    
    
    
    
    


