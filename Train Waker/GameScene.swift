//
//  GameScene.swift
//  Train Waker
//
//  Created by Jenny Kim on 7/11/16.
//  Copyright (c) 2016 Jenny Kim. All rights reserved.
//



/*NOTE: SET A SPEED LIMIT TO TIMER!!!!!!!!!
 Also get the timer of train light to move
 Find alternative way to change colour or test out the NSTimeInterval
 
 */
import SpriteKit

enum gameState {
    case Title, Ready, Playing, GameOver
}
var state: gameState = .Ready

class GameScene: SKScene {
    
    var trainLight: SKSpriteNode!
    var trainLightSpace: CGFloat = 1.0{
        didSet{
            if trainLightSpace > 1.0 {trainLightSpace = 1.0}
            trainLight.xScale = trainLightSpace
        }
    }
    var trainLightBase: SKSpriteNode!
    
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
    
    var scoreLabel: SKLabelNode!
    var score: Int = 0 {
        didSet {
            scoreLabel.text = String(score)
            endScoreLabel.text = String(score)
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
    
    var thoughtCloud1: SKSpriteNode!
    var thoughtCloud2: SKSpriteNode!
    var thoughtCloud3: SKSpriteNode!
    var thoughtCloud4: SKSpriteNode!
    
    var keepTimerOnTrack: Int = 1
    var trackRounds: Int = 1
    var spriteWakeUp: Bool = true
    var timerBarSpeed: Double = 0.008
    var trainLightBarSpeed: Double = 0.008
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    var touchArea1: SKSpriteNode!
    
    var endGameBackground: SKSpriteNode!
    var gameOverLabel: SKLabelNode!
    var endScoreLabel: SKLabelNode!
    
    
    var restartButton: MSButtonNode!
    
    var changedToRed: Bool = false
    var changedToYellow: Bool = false
    var changedToGreen: Bool = false
    
    override func didMoveToView(view: SKView) {
        
        /* Setup your scene here */
        trainLight = childNodeWithName("trainLight") as! SKSpriteNode
        trainLightBase = childNodeWithName("trainLightBase") as! SKSpriteNode
        
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
        scoreLabel = childNodeWithName("scoreLabel") as! SKLabelNode
        
        //Instead of code connections similar to ones above, the signs are connected while Passenger1 (2,3...etc.) is being initialized for the Passenger class
        Passenger1 = Passenger(sleepSign: childNodeWithName("sleepSign") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign") as! SKSpriteNode, thoughtCloud: childNodeWithName("thoughtCloud1") as! SKSpriteNode, sprite: childNodeWithName("Pass1") as! SKSpriteNode)
        Passenger2 = Passenger(sleepSign: childNodeWithName("sleepSign2") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign2") as! SKSpriteNode, thoughtCloud: childNodeWithName("thoughtCloud2") as! SKSpriteNode, sprite: childNodeWithName("Pass2") as! SKSpriteNode)
        Passenger3 = Passenger(sleepSign: childNodeWithName("sleepSign3") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign3") as! SKSpriteNode, thoughtCloud: childNodeWithName("thoughtCloud3") as! SKSpriteNode, sprite: childNodeWithName("Pass3") as! SKSpriteNode)
        Passenger4 = Passenger(sleepSign: childNodeWithName("sleepSign4") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign4") as! SKSpriteNode, thoughtCloud: childNodeWithName("thoughtCloud4") as! SKSpriteNode, sprite: childNodeWithName("Pass4") as! SKSpriteNode)
        
        endGameBackground = childNodeWithName("endGameBackground") as! SKSpriteNode
        endScoreLabel = childNodeWithName("//endScoreLabel") as! SKLabelNode
        restartButton = childNodeWithName("//restartButton") as! MSButtonNode
        restartButton.selectedHandler = {
            
            /* Grab reference to our SpriteKit view */
            let skView = self.view as SKView!
            
            /* Load Game scene */
            let scene = GameScene(fileNamed:"GameScene") as GameScene!
            
            //Resets the score for each round :^)
            self.score = 0
            
            /* Ensure correct aspect mode */
            scene.scaleMode = .AspectFill
            
            /* Restart game scene */
            skView.presentScene(scene)
            
            state = .Playing
            
        }
        /* Hide restart button */
        restartButton.state = .Hidden
        

        

        if state == .Ready{
            state = .Playing
        }

        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        /* Game will not continue if it is game over */
        if state == .GameOver || state == .Title{return}
        
        
        //This will be for implementing scores
        if state != .GameOver {

            for touch in touches {
                let point = touch.locationInNode(self)
                print(point)
                
                let nodeTouched = nodeAtPoint(point)
                print(nodeTouched)
                
                
                //Passenger 1 is touched
                if Passenger1.awakeSign.hidden == false{
                    if nodeTouched.name == "touchArea1"{
                        score += 1
                        Passenger1.awaken()
                    }
                }else if Passenger1.awakeSign.hidden == true{
                    if nodeTouched.name == "touchArea1"{
                    gameOver()
                }
            }
                
                
                // Passenger 2 is touched
                if Passenger2.awakeSign.hidden == false{
                    if nodeTouched.name == "touchArea2"{
                        score += 1
                        Passenger2.awaken()
                    }
                }else if Passenger2.awakeSign.hidden == true{
                    if nodeTouched.name == "touchArea2"{
                        gameOver()
                    }
                }
                
                //Passenger 3 is touched
                if Passenger3.awakeSign.hidden == false{
                    if nodeTouched.name == "touchArea3"{
                        score += 1
                        Passenger3.awaken()
                    }
                }else if Passenger3.awakeSign.hidden == true{
                    if nodeTouched.name == "touchArea3"{
                        gameOver()
                    }
                }
                
                //Passenger 4 is touched
                if Passenger4.awakeSign.hidden == false{
                    if nodeTouched.name == "touchArea4"{
                        score += 1
                        Passenger4.awaken()
                    }
               }
                else if Passenger4.awakeSign.hidden == true{
                    if nodeTouched.name == "touchArea4"{
                        gameOver()
                    }
                }
                
            }
        }

    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered*/
        
        /* Basically if it's game over or the start menu, then the timer countdown will not start to decrease*/
        if state != .Playing { return }
        
        //Ultimately decreases the timer each time the program goes through the update function. Increases the speed at which it decreases every 5 rounds. Stops the timer from decreasing when it's 0 or less.
        if timer > 0{
        if trackRounds % 5 == 0{
           timerBarSpeed += 0.0001
        }
        
        timer -= CGFloat(timerBarSpeed)
        }
        
        //Calls the turnOnWaitLight function in WaitLight class to make wait light dots appear
        WaitLight(scene1: scene as! GameScene).turnOnWaitLight()
        
        
        
        //This if statement will make the train light change colors and reset the timer when the var "keepTimerOnTrack" is 1 and the timer is between 0 to -0.01
        
        if trainLightSpace > -0.1 && timer < 0  && timer > -0.1{

        
            trackRounds += 1
            
            
            //By calling the randomawake function, the passengers will randomly want to be awake. Depending on the number (0 or 1) that is generated, the passenger will either stay asleep or want to be woken up
            if spriteWakeUp == true{
                Passenger1.randomawake()
                Passenger2.randomawake()
                Passenger3.randomawake()
                Passenger4.randomawake()
            
                if Passenger1.awakeSign.hidden == true && Passenger2.awakeSign.hidden == true && Passenger3.awakeSign.hidden == true && Passenger4.awakeSign.hidden == true{
                    Passenger2.awake()
            }
            
                spriteWakeUp = false
            }
            
            if trainLightSpace > 0{
                if trackRounds % 5 == 0{
                    trainLightBarSpeed += 0.0001
                }
                
                trainLightSpace -= CGFloat(trainLightBarSpeed)
            }
            
            //This will assign light to the class of TrainLight and then the program will call the function colorChange witht he properties of light. This way, the properties of TrainLight are not called over and over again, like how it would have done if we did "TrainLight(scene1: scene as! GameScene).colorChange
            let light = TrainLight(scene1: scene as! GameScene)
            
            
            colorChange(light)
            
            
            completeRound()
            
        }
    }
    
    
    
    
    func gameOver(){
        state = .GameOver
        
        let moveDown = SKAction.moveByX(0, y:-320, duration:0.5)
        let downSequence = SKAction.sequence([moveDown])
        
        self.endGameBackground.runAction(downSequence)
        
        restartButton.state = .Active

        }
    
    
    
    func check(){
        if Passenger1.awakeSign.hidden == false || Passenger2.awakeSign.hidden == false || Passenger3.awakeSign.hidden == false || Passenger4.awakeSign.hidden == false{
                gameOver()
    }
        
    }
    
    func completeRound(){
        if trainLightSpace <= 0 && trainLightSpace > -0.1{
            let action4 = SKAction.colorizeWithColor(UIColor.darkGrayColor(), colorBlendFactor: 0, duration: 0.5)
            let recolor4 = SKAction.sequence([action4])
            trainLight.runAction(recolor4)
            
            
            //After the recolor sequence has run, the following statements will run as well
            timer = 1.0
            timerBar.hidden = false
            
            trainLightSpace = 1.0
            changedToGreen = false
            changedToYellow = false
            changedToRed = false
            
            waitLight.hidden = true
            waitLight2.hidden = true
            waitLight3.hidden = true
            waitLight4.hidden = true
            
            Passenger1.sleeping()
            Passenger2.sleeping()
            Passenger3.sleeping()
            Passenger4.sleeping()
            check()
            spriteWakeUp = true

        }
    }
    
    func colorChange(light: TrainLight) {
    
        let calculate1: Float = Float(light.trainLightOGWidth * (2.0/3))
        let calculate2: Float = Float(light.trainLightOGWidth * (1.0/3))
        
        if light.trainLightWidth > calculate1 && !changedToGreen {
            changedToGreen = true
            let action1 = SKAction.colorizeWithColor(UIColor.greenColor(), colorBlendFactor: 0, duration: 0.5)
            let waitAction = SKAction.waitForDuration(0.5)
            let recolor1 = SKAction.sequence([action1, waitAction])
            trainLight.runAction(recolor1)
            
            
        }
        
        if light.trainLightWidth > calculate2 && light.trainLightWidth < calculate1 && !changedToYellow{
            let action2 = SKAction.colorizeWithColor(UIColor.yellowColor(), colorBlendFactor: 0, duration: 0.5)
            let waitAction = SKAction.waitForDuration(0.5)
            let recolor2 = SKAction.sequence([action2, waitAction])
            trainLight.runAction(recolor2)
            changedToYellow = true
        }
        
        if light.trainLightWidth > 0 && light.trainLightWidth < calculate2 && !changedToRed {
            let action3 = SKAction.colorizeWithColor(UIColor.redColor(), colorBlendFactor: 0, duration: 0.5)
            let waitAction = SKAction.waitForDuration(0.5)
            let recolor3 = SKAction.sequence([action3, waitAction])
            trainLight.runAction(recolor3)
            changedToRed = true
        }
    
    }
    
}

















