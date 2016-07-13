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
            timerBar.xScale = timer
        }
    }
    var state: gameState = .Title




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
    
     func viewDidLoad() {
    
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered*/
         
         
        /* Basically if it's game over or the start menu, then the timer countdown will not start to decrease*/
        if state != .Playing { return }
        
        /* Decreases the timer each time the program goes through the update function */
        timer -= 0.01
        
        print(timer)
        /* If the timer is less than 0, the train light color will change from default to green */
        if timer < 0 && timer > -0.1 {
            let action = SKAction.colorizeWithColor(UIColor.greenColor(), colorBlendFactor: 0, duration: 2)
          //  let action1 = SKAction.colorizeWithColor(UIColor.yellowColor(), colorBlendFactor: 1, duration: 2)
            let recolor = SKAction.sequence([action])
            self.trainLight.runAction(recolor)
            
            
            
        }

    
        if timer < -0.5 && timer > -0.51 {
            let action = SKAction.colorizeWithColor(UIColor.grayColor(), colorBlendFactor: 0, duration: 2)
            let recolor = SKAction.sequence([action])
            self.trainLight.runAction(recolor)
            
        }
        
        
        
        
        
    }
    
    

    
    
    
    
    
    
    
    
    
    
    
    
}

