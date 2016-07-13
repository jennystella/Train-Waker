//
//  GameScene.swift
//  Train Waker
//
//  Created by Jenny Kim on 7/11/16.
//  Copyright (c) 2016 Jenny Kim. All rights reserved.
//

import SpriteKit

var gameTimer: NSTimer!

class GameScene: SKScene {
    var trainLight: SKSpriteNode!
    let fixedDelta: CFTimeInterval = 1.0/60.0 /* 60 FPS */
    var timeChange: CFTimeInterval = 0

    
 //   var timestamp: NSTimeInterval { get }

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        trainLight = childNodeWithName("trainLight") as! SKSpriteNode
        
        let action2 = SKAction.colorizeWithColor(UIColor.grayColor(), colorBlendFactor: 1, duration: 0.5)
        let recolor = SKAction.sequence([action2])
        self.trainLight.runAction(recolor)
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        

        }
    
     func viewDidLoad() {
//        var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: #selector(MyClass.update), userInfo: nil, repeats: true)
//        //Swift <2.2 selector syntax
//        var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "update", userInfo: nil, repeats: true)

        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */

        if (timeChange >= 2){
//        gameTimer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
            changeColor()
            let action2 = SKAction.colorizeWithColor(UIColor.grayColor(), colorBlendFactor: 1, duration: 0.5)
            let recolor = SKAction.sequence([action2])
            self.trainLight.runAction(recolor)
            timeChange = 0
            print("New timeChange")

    }

        
        timeChange += fixedDelta
        print (timeChange)
        print (fixedDelta)
    }
    func changeColor(){
                let action = SKAction.colorizeWithColor(UIColor.greenColor(), colorBlendFactor: 1, duration: 2)
                let action1 = SKAction.colorizeWithColor(UIColor.yellowColor(), colorBlendFactor: 1, duration: 2)
                let recolor = SKAction.sequence([action, action1])
                self.trainLight.runAction(recolor)
        

            }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }

