//
//  GameScene.swift
//  Train Waker
//
//  Created by Jenny Kim on 7/11/16.
//  Copyright (c) 2016 Jenny Kim. All rights reserved.
//


/*
 -Tutorial 2 = Check out the commented lines, fill them in and get assets

-Play around with speeds at rounds*
-Bonus points*
-Instructions* - LATER add in screenshots 
-Background Moving 3
-Pause*
-High Score
-Make random texts appear for passengers and trick 'em (NOTE: Add it in earlier)*
-Make one seat on the other side
-Get passenger sprites 1/ 4
-Sounds 5
-Vibration
 
 */

import SpriteKit

enum gameState {
    case Title, Ready, Playing, Paused, GameOver
}
var state: gameState = .Ready

enum Color{
    case Green, Yellow, Red, Nothing
}

class GameScene: SKScene {
    
    var colorState: Color = .Nothing
    
    var trainLight: SKSpriteNode!
    var trainSpeedAllow: Bool = true
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
    var timeAllow: Bool = true
    var timer: CGFloat = 1.0{
        didSet{
            /* Cap timer */
            if timer > 1.0 { timer = 1.0 }
            timerBar.xScale = timer
        }
    }
    
    var scoreLabel: SKLabelNode!
    var scoreMultiplier: Int = 1
    var scoreAllow: Bool = true
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
    
    var questionSign1: SKSpriteNode!
    var questionSign2: SKSpriteNode!
    var questionSign3: SKSpriteNode!
    var questionSign4: SKSpriteNode!

    
    var bonusSign1: SKLabelNode!
    var bonusSign2: SKLabelNode!
    var bonusSign3: SKLabelNode!
    var bonusSign4: SKLabelNode!
    
    var touchHand1: SKSpriteNode!
    var touchHand2: SKSpriteNode!
    var touchHand3: SKSpriteNode!
    var touchHand4: SKSpriteNode!
    
    var tapSign1: SKLabelNode!
    var tapSign2: SKLabelNode!
    var tapSign3: SKLabelNode!
    var tapSign4: SKLabelNode!
    
    var tutorialBox1: SKSpriteNode!
    var tutorialBox2: SKSpriteNode!
    var tutorialBox3: SKSpriteNode!

    var tapToContinueLabel: SKLabelNode!
    var tapToContinueArea: MSButtonNode!
//    var tapToContinueArea2: MSButtonNode!
    var congratsLabel: SKLabelNode!
    
    var keepTimerOnTrack: Int = 1
    var trackRounds: Int = 1
    var spriteWakeUp: Bool = true
    var timerBarSpeed: Double = 0.007
    var trainLightBarSpeed: Double = 0.008
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    var touchArea1: SKSpriteNode!
    
    var endGameBackground: SKSpriteNode!
    var gameOverLabel: SKLabelNode!
    var endScoreLabel: SKLabelNode!
    
    var message: SKSpriteNode!
    
    
    var restartButton: MSButtonNode!
    var helpGameButton: MSButtonNode!
    var pauseButton: MSButtonNode!
    
    var changedToRed: Bool = false
    var changedToYellow: Bool = false
    var changedToGreen: Bool = false
    
    var showMessage: Bool = true
    
    /* Level loader holder */
    var helpSceneScreen: HelpScene!
    
    var pauseMenu: SKSpriteNode!
    var playButton: MSButtonNode!
    var homeButton: MSButtonNode!
    var refreshButton: MSButtonNode!
    let gameManager = UserState.sharedInstance
    
    var tutorialContinue1: Bool = true
    var tutorialContinue2: Bool = true

    
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
        
//        let highScore = gameManager.highScore


        timerBar = childNodeWithName("timerBar") as! SKSpriteNode
        scoreLabel = childNodeWithName("scoreLabel") as! SKLabelNode
        
        //Instead of code connections similar to ones above, the signs are connected while Passenger1 (2,3...etc.) is being initialized for the Passenger class
        Passenger1 = Passenger(sleepSign: childNodeWithName("sleepSign") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign") as! SKSpriteNode, thoughtCloud: childNodeWithName("thoughtCloud1") as! SKSpriteNode, questionSign: childNodeWithName("questionSign1") as! SKSpriteNode, sprite: childNodeWithName("Pass1") as! SKSpriteNode)
        Passenger2 = Passenger(sleepSign: childNodeWithName("sleepSign2") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign2") as! SKSpriteNode, thoughtCloud: childNodeWithName("thoughtCloud2") as! SKSpriteNode, questionSign: childNodeWithName("questionSign2") as! SKSpriteNode, sprite: childNodeWithName("Pass2") as! SKSpriteNode)
        Passenger3 = Passenger(sleepSign: childNodeWithName("sleepSign3") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign3") as! SKSpriteNode, thoughtCloud: childNodeWithName("thoughtCloud3") as! SKSpriteNode, questionSign: childNodeWithName("questionSign3") as! SKSpriteNode, sprite: childNodeWithName("Pass3") as! SKSpriteNode)
        Passenger4 = Passenger(sleepSign: childNodeWithName("sleepSign4") as! SKSpriteNode, awakeSign: childNodeWithName("awakeSign4") as! SKSpriteNode, thoughtCloud: childNodeWithName("thoughtCloud4") as! SKSpriteNode, questionSign: childNodeWithName("questionSign4") as! SKSpriteNode, sprite: childNodeWithName("Pass4") as! SKSpriteNode)
        
        bonusSign1 = childNodeWithName("bonusSign1") as! SKLabelNode
        bonusSign2 = childNodeWithName("bonusSign2") as! SKLabelNode
        bonusSign3 = childNodeWithName("bonusSign3") as! SKLabelNode
        bonusSign4 = childNodeWithName("bonusSign4") as! SKLabelNode
        
        bonusSign1.alpha = 0
        bonusSign2.alpha = 0
        bonusSign3.alpha = 0
        bonusSign4.alpha = 0

        touchHand1 = childNodeWithName("touchHand1") as! SKSpriteNode
        touchHand2 = childNodeWithName("touchHand2") as! SKSpriteNode
        touchHand3 = childNodeWithName("touchHand3") as! SKSpriteNode
        touchHand4 = childNodeWithName("touchHand4") as! SKSpriteNode

        touchHand1.hidden = true
        touchHand2.hidden = true
        touchHand3.hidden = true
        touchHand4.hidden = true
        
        tapSign1 = childNodeWithName("tapSign1") as! SKLabelNode
        tapSign2 = childNodeWithName("tapSign2") as! SKLabelNode
        tapSign3 = childNodeWithName("tapSign3") as! SKLabelNode
        tapSign4 = childNodeWithName("tapSign4") as! SKLabelNode

        tapSign1.hidden = true
        tapSign2.hidden = true
        tapSign3.hidden = true
        tapSign4.hidden = true

        tutorialBox1 = childNodeWithName("tutorialBox1") as! SKSpriteNode
        tutorialBox2 = childNodeWithName("tutorialBox2") as! SKSpriteNode
        tutorialBox3 = childNodeWithName("tutorialBox3") as! SKSpriteNode

        tutorialBox1.hidden = true
        tutorialBox2.hidden = true
        tutorialBox3.hidden = true
        
        tapToContinueLabel = childNodeWithName("tapToContinueLabel") as! SKLabelNode
        tapToContinueArea = childNodeWithName("tapToContinueArea") as! MSButtonNode
//        tapToContinueArea2 = childNodeWithName("tapToContinueArea2") as! MSButtonNode
        congratsLabel = childNodeWithName("congratsLabel") as! SKLabelNode
        tapToContinueLabel.hidden = true
        tapToContinueArea.hidden = true
//        tapToContinueArea2.hidden = true
        congratsLabel.alpha = 0
        
        tapToContinueArea.selectedHandler = {
            state = .Playing
            self.tutorialContinue1 = false
            self.tutorialBox1.hidden = true
            self.tutorialBox2.hidden = true
            self.tutorialBox3.hidden = true
            self.message.hidden = true
            self.tapToContinueLabel.hidden = true
            self.tapToContinueArea.hidden = true
        }
        
//        tapToContinueArea2.selectedHandler = {
//            state = .Playing
//            self.message.hidden = true
//            self.tapToContinueLabel.hidden = true
//            self.tapToContinueArea2.hidden = true
//        }


        
        
        let resourcePath = NSBundle.mainBundle().pathForResource("HelpScene", ofType: "sks")
        helpSceneScreen = HelpScene(URL: NSURL (fileURLWithPath: resourcePath!))
        helpSceneScreen.zPosition = 100
        addChild(helpSceneScreen)
        

        endGameBackground = childNodeWithName("endGameBackground") as! SKSpriteNode
        endScoreLabel = childNodeWithName("//endScoreLabel") as! SKLabelNode
        restartButton = childNodeWithName("//restartButton") as! MSButtonNode
        helpGameButton = childNodeWithName("helpGameButton") as! MSButtonNode
        pauseButton = childNodeWithName("pauseButton") as! MSButtonNode
        
        message = childNodeWithName("message") as! SKSpriteNode
        message.hidden = true
        
        pauseMenu = childNodeWithName("pauseMenu") as! SKSpriteNode
        playButton = childNodeWithName("//playButton") as! MSButtonNode
        homeButton = childNodeWithName("//homeButton") as! MSButtonNode
        refreshButton = childNodeWithName("//refreshButton") as! MSButtonNode

        
        helpGameButton.selectedHandler = {
            
            self.gameManager.lastScene = "gameScene"
            state = .Paused
            
            self.helpSceneScreen.hidden = false
            
        }
        self.helpSceneScreen.hidden = true
        
        
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
        
        pauseButton.selectedHandler = {
            state = .Paused
            self.gameManager.pause = true
            self.homeButton.state = .Active
            self.playButton.state = .Active
            self.refreshButton.state = .Active
            self.pauseMenu.hidden = false

            
        }
        
        pauseMenu.hidden = true
        homeButton.state = .Hidden
        playButton.state = .Hidden
        refreshButton.state = .Hidden
        
        homeButton.selectedHandler = {
            self.gameManager.pause = false
            /* Grab reference to our SpriteKit view */
            let skView = self.view as SKView!
            
            /* Load Game scene */
            let scene = StartMenu(fileNamed:"StartMenu") as StartMenu!
            
            /* Ensure correct aspect mode */
            scene.scaleMode = .AspectFill
            
            /* Restart game scene */
            skView.presentScene(scene)
        }
        
        playButton.selectedHandler = {
            self.gameManager.pause = false
            state = .Playing
            self.pauseMenu.hidden = true
            
        }
        
        refreshButton.selectedHandler = {
            self.gameManager.pause = false
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
                //print(point)
                
                let nodeTouched = nodeAtPoint(point)
                //print(nodeTouched)
                
//                if gameManager.tutorialOptional == false && trackRounds == 1 && tutorialContinue1 == true {
//                    if nodeTouched.name == tapToContinueArea{
//                        state = .Playing
//                        tutorialContinue1 = false
//                        tutorialBox1.hidden = true
//                        tutorialBox2.hidden = true
//                        tutorialBox3.hidden = true
//                        tapToContinueLabel.hidden = true
//                        tapToContinueArea.hidden = true
//                    }
//                }
                
                //Passenger 1 is touched
                if Passenger1.awakeSign.hidden == false{
                    if nodeTouched.name == "touchArea1"{
                        if colorState == .Green{
                            score += scoreMultiplier * 2
                            bonusFade(bonusSign1)
                            if trackRounds == 1 && tutorialContinue2 == true && gameManager.tutorialOptional == false{
                                touchHand1.hidden = true
                                tapSign1.hidden = true
                            }
                        }
                        else {
                            score += scoreMultiplier
                            if trackRounds == 1 && tutorialContinue2 == true && gameManager.tutorialOptional == false{
                                touchHand1.hidden = true
                                tapSign1.hidden = true
                            }
                        }
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
                        if colorState == .Green{
                            score += scoreMultiplier * 2
                            bonusFade(bonusSign2)
                            if trackRounds == 1 && tutorialContinue2 == true && gameManager.tutorialOptional == false{
                                touchHand2.hidden = true
                                tapSign2.hidden = true
                            }
                        }
                        else{
                            score += scoreMultiplier
                            if trackRounds == 1 && tutorialContinue2 == true && gameManager.tutorialOptional == false{
                                touchHand2.hidden = true
                                tapSign2.hidden = true
                            }
                        }
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
                        if colorState == .Green{
                            score += scoreMultiplier * 2
                            bonusFade(bonusSign3)
                            if trackRounds == 1 && tutorialContinue2 == true && gameManager.tutorialOptional == false{
                                touchHand3.hidden = true
                                tapSign3.hidden = true
                            }
                        }
                        else{
                            score += scoreMultiplier
                            if trackRounds == 1 && tutorialContinue2 == true && gameManager.tutorialOptional == false{
                                touchHand3.hidden = true
                                tapSign3.hidden = true
                            }
                        }
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
                        if colorState == .Green{
                            score += scoreMultiplier * 2
                            bonusFade(bonusSign4)
                            if trackRounds == 1 && tutorialContinue2 == true && gameManager.tutorialOptional == false{
                                touchHand4.hidden = true
                                tapSign4.hidden = true
                            }
                        }
                        else{
                            score += scoreMultiplier
                            if trackRounds == 1 && tutorialContinue2 == true && gameManager.tutorialOptional == false{
                                touchHand4.hidden = true
                                tapSign4.hidden = true
                            }
                        }
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
        
        if state == .Paused {
            return
        }
        
        /* Basically if it's game over or the start menu, then the timer countdown will not start to decrease*/
        if state != .Playing { return }
        
        tutorialPart()
        
        if Double(trackRounds) % 4.0 == 0 && scoreAllow == true{
            scoreMultiplier += 1
            scoreAllow = false
        }
        
        if trackRounds > 3 && showMessage == true && gameManager.tutorialOptional2 == false{
            messageSign()
            showMessage = false
        }
        
        //Ultimately decreases the timer each time the program goes through the update function. Increases the speed at which it decreases every 5 rounds. Stops the timer from decreasing when it's 0 or less.
        if timer > 0{
        if Double(trackRounds) % 4 == 0 && timeAllow == true && timerBarSpeed < 0.016{
            timerBarSpeed += 0.002
            timeAllow = false
        }
        
        timer -= CGFloat(timerBarSpeed)
        }
        
        //Calls the turnOnWaitLight function in WaitLight class to make wait light dots appear
        WaitLight(scene1: scene as! GameScene).turnOnWaitLight()
        
        
        
        //This if statement will make the train light change colors and reset the timer when the var "keepTimerOnTrack" is 1 and the timer is between 0 to -0.01
        
        if trainLightSpace > -0.1 && timer < 0  && timer > -0.1{
            
            //By calling the randomawake function, the passengers will randomly want to be awake. Depending on the number (0 or 1) that is generated, the passenger will either stay asleep or want to be woken up
            if spriteWakeUp == true{
                Passenger1.randomawake(trackRounds)
                Passenger2.randomawake(trackRounds)
                Passenger3.randomawake(trackRounds)
                Passenger4.randomawake(trackRounds)
            
                if Passenger1.awakeSign.hidden == true && Passenger2.awakeSign.hidden == true && Passenger3.awakeSign.hidden == true && Passenger4.awakeSign.hidden == true{
                    Passenger2.awake()
            }
            
                spriteWakeUp = false
            }
            
            tutorialPart2()
            
            if trainLightSpace > 0{
                if Double(trackRounds) % 4 == 0 && trainSpeedAllow == true && trainLightBarSpeed < 0.016{
                    trainLightBarSpeed += 0.002
                    trainSpeedAllow = false
                }
                
                trainLightSpace -= CGFloat(trainLightBarSpeed)
                print(trainLightBarSpeed)
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
            congratulations()

            timer = 1.0
            timerBar.hidden = false
            
            trainLightSpace = 1.0
            changedToGreen = false
            changedToYellow = false
            changedToRed = false
            colorState = .Nothing
            
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
            
            scoreAllow = true
            timeAllow = true
            trainSpeedAllow = true
            trackRounds += 1
            
            
            gameManager.tutorialOptional = true
            tutorialContinue2 = false


        }
    }
    
    func colorChange(light: TrainLight) {
    
        let calculate1: Float = Float(light.trainLightOGWidth * (2.0/3))
        let calculate2: Float = Float(light.trainLightOGWidth * (1.0/3))
        
        if light.trainLightWidth > calculate1 && !changedToGreen {
            changedToGreen = true
            colorState = .Green
            let action1 = SKAction.colorizeWithColor(UIColor.greenColor(), colorBlendFactor: 0, duration: 0.5)
            let waitAction = SKAction.waitForDuration(0.5)
            let recolor1 = SKAction.sequence([action1, waitAction])
            trainLight.runAction(recolor1)
        }
        
        
        if light.trainLightWidth > calculate2 && light.trainLightWidth < calculate1 && !changedToYellow{
            colorState = .Yellow
            let action2 = SKAction.colorizeWithColor(UIColor.yellowColor(), colorBlendFactor: 0, duration: 0.5)
            let waitAction = SKAction.waitForDuration(0.5)
            let recolor2 = SKAction.sequence([action2, waitAction])
            trainLight.runAction(recolor2)
            changedToYellow = true
        }
        
        
        if light.trainLightWidth > 0 && light.trainLightWidth < calculate2 && !changedToRed {
            colorState = .Red
            let action3 = SKAction.colorizeWithColor(UIColor.redColor(), colorBlendFactor: 0, duration: 0.5)
            let waitAction = SKAction.waitForDuration(0.5)
            let recolor3 = SKAction.sequence([action3, waitAction])
            trainLight.runAction(recolor3)
            changedToRed = true
        }
    
    }
    
    func bonusFade(bonusSign: SKLabelNode){
        let fadeAction1 = SKAction.fadeAlphaTo(1, duration: 0.5)
        let fadeAction2 = SKAction.fadeAlphaTo(0, duration: 0.5)
        
        let runFade = SKAction.sequence([fadeAction1, fadeAction2])
        bonusSign.runAction(runFade)

    }
    
    func messageSign(){
        message.hidden = false
        tapToContinueLabel.hidden = false
        tapToContinueArea.hidden = false
        state = .Paused
        gameManager.tutorialOptional = true

    
    }
    
    func tutorialPart(){
       //To show the wait light bar and train light bar instructions
        if gameManager.tutorialOptional == false && trackRounds == 1 && tutorialContinue1 == true {
        tutorialBox1.hidden = false
        tutorialBox2.hidden = false
        tutorialBox3.hidden = false
        tapToContinueLabel.hidden = false
        tapToContinueArea.hidden = false
        state = .Paused
            
        }
        
        
    }
    
    func tutorialPart2(){
        //To show the user what to tap on
        if gameManager.tutorialOptional == false && trackRounds == 1 && tutorialContinue2 == true {
            //do if each awake symbols are not hidden, then the hand sign is not hidden
            //[label].hidden = false (for the "tap" part)
            
            if Passenger1.awakeSign.hidden == false{
                touchHand1.hidden = false
                tapSign1.hidden = false
            }
            if Passenger2.awakeSign.hidden == false{
                touchHand2.hidden = false
                tapSign2.hidden = false
            }
            if Passenger3.awakeSign.hidden == false{
                touchHand3.hidden = false
                tapSign3.hidden = false
            }
            if Passenger4.awakeSign.hidden == false{
                touchHand4.hidden = false
                tapSign4.hidden = false
            }
        }
        
        
        
    }

    func congratulations(){
        if trackRounds == 1 && tutorialContinue2 == true && gameManager.tutorialOptional == false{
        let fadeAction1 = SKAction.fadeAlphaTo(1, duration: 0.5)
        let fadeAction2 = SKAction.fadeAlphaTo(0, duration: 0.5)
        
        let runFade = SKAction.sequence([fadeAction1, fadeAction2])
        congratsLabel.runAction(runFade)
        }
    }

}














