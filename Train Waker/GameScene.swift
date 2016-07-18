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
    
    var waitLight: SKSpriteNode!
    var waitLight2: SKSpriteNode!
    var waitLight3: SKSpriteNode!
    var waitLight4: SKSpriteNode!
    
    
    //This is for the timer countdown of the train light
    var timerBar: SKSpriteNode!
    var timer: CGFloat = 1.0{
        didSet{
            /* Cap timer */
            if timer > 1.0 { timer = 1.0 }
            timerBar.xScale = timer
        }
    }

    
    //Objects Passenger
    //This calls the passenger class and assigns a passgener object
    var Passenger1: Passenger!
    var Passenger2: Passenger!
    var Passenger3: Passenger!
    var Passenger4: Passenger!
    
    var sleepSign: SKSpriteNode!
    var sleepSign2: SKSpriteNode!
    var sleepSign3: SKSpriteNode!
    var sleepSign4: SKSpriteNode!

    var awakeSign:  SKSpriteNode!
    var awakeSign2: SKSpriteNode!
    var awakeSign3: SKSpriteNode!
    var awakeSign4: SKSpriteNode!

    
    var state: gameState = .Title
    
    var keepTimerOnTrack: Int = 1
    
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        trainLight = childNodeWithName("trainLight") as! SKSpriteNode
        
        
        waitLight = childNodeWithName("waitLight") as! SKSpriteNode
        waitLight2 = childNodeWithName("waitLight2") as! SKSpriteNode
        waitLight3 = childNodeWithName("waitLight3") as! SKSpriteNode
        waitLight4 = childNodeWithName("waitLight4") as! SKSpriteNode
        
        //This is to make each wait light invisible at the beginning
        waitLight.hidden = true
        waitLight2.hidden = true
        waitLight3.hidden = true
        waitLight4.hidden = true
        
        
        timerBar = childNodeWithName("timerBar") as! SKSpriteNode
        

        //Instead of code connections similar to ones above, the signs are connected while Passenger1 (2,3...etc.) is being initialized for the Passenger class
        Passenger1 = Passenger(sleepSign: childNodeWithName("sleepSign") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign") as! SKSpriteNode, sprite: childNodeWithName("Pass1") as! SKSpriteNode)
        Passenger2 = Passenger(sleepSign: childNodeWithName("sleepSign2") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign2") as! SKSpriteNode, sprite: childNodeWithName("Pass2") as! SKSpriteNode)
        Passenger3 = Passenger(sleepSign: childNodeWithName("sleepSign3") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign3") as! SKSpriteNode, sprite: childNodeWithName("Pass3") as! SKSpriteNode)
        Passenger4 = Passenger(sleepSign: childNodeWithName("sleepSign4") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign4") as! SKSpriteNode, sprite: childNodeWithName("Pass4") as! SKSpriteNode)
        
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
        
        print(timerBar.size.width)
        
        //Calls the turnOnWaitLight function in WaitLight class to make wait light dots appear
        WaitLight(scene1: scene as! GameScene).turnOnWaitLight()
        
        
        //This if statement will make the train light change colors and reset the timer when the var "keepTimerOnTrack" is 1 and the timer is between 0 to -0.01
        if keepTimerOnTrack == 1 && timer < 0  && timer > -0.01{
            
            timerBar.hidden = true
            
            Passenger1.randomawake()
            Passenger2.randomawake()
            Passenger3.randomawake()
            Passenger4.randomawake()
            
            
            let action = SKAction.colorizeWithColor(UIColor.greenColor(), colorBlendFactor: 0, duration: 1)
            let action1 = SKAction.colorizeWithColor(UIColor.yellowColor(), colorBlendFactor: 0, duration: 1)
            let action2 = SKAction.colorizeWithColor(UIColor.grayColor(), colorBlendFactor: 0, duration: 1)
            let waitAction = SKAction.waitForDuration(1)
            
            let recolor = SKAction.sequence([action, waitAction, action1, waitAction, action2, waitAction])
            self.trainLight.runAction(recolor, completion: {
                self.keepTimerOnTrack -= 1
                self.timer = 1.0
                self.timerBar.hidden = false
                
                self.waitLight.hidden = true
                self.waitLight2.hidden = true
                self.waitLight3.hidden = true
                self.waitLight4.hidden = true
                
                self.Passenger1.sleeping()
                self.Passenger2.sleeping()
                self.Passenger3.sleeping()
                self.Passenger4.sleeping()

                
            })
            
            
            //Helps put "keepTimerOnTrack" back to 1 so that the program may enter the if loop and change colours again in the next round
            keepTimerOnTrack += 1
        }
        
        
        
    }
    
    
    
    
    
}

















