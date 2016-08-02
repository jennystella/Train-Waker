//
//  Passenger.swift
//  Train Waker
//
//  Created by Jenny Kim on 7/18/16.
//  Copyright © 2016 Jenny Kim. All rights reserved.
//

import Foundation
import SpriteKit

class Passenger {
    
    var sleepSign: SKSpriteNode
    var awakeSign: SKSpriteNode
    var thoughtCloud: SKSpriteNode
    var questionSign: SKSpriteNode
    var sprite: SKSpriteNode
    
    init(sleepSign: SKSpriteNode, awakeSign: SKSpriteNode, thoughtCloud: SKSpriteNode, questionSign: SKSpriteNode, sprite: SKSpriteNode){
        self.sleepSign = sleepSign
        self.awakeSign = awakeSign
        self.thoughtCloud = thoughtCloud
        self.questionSign = questionSign
        self.sprite = sprite
        sleeping()
    }

    
    func sleeping(){
        if awakeSign.hidden == false && state == .Playing { return}
        sleepSign.hidden = false
        awakeSign.hidden = true
        questionSign.hidden = true
        thoughtCloud.hidden = false
        
    }
    func awake(){
        sleepSign.hidden = true
        awakeSign.hidden = false
        questionSign.hidden = true
        thoughtCloud.hidden = false
    }
    
    func awaken(){
        sleepSign.hidden = true
        awakeSign.hidden = true
        questionSign.hidden = true
        thoughtCloud.hidden = true
        
    }
    
    func thinking(){
        sleepSign.hidden = true
        awakeSign.hidden = true
        questionSign.hidden = false
        thoughtCloud.hidden = false
    }
    
    func randomawake(round: Int){
    
        let choice: Int
        if round > 10{
        choice = Int(arc4random_uniform(3))
        } else{
            choice = Int(arc4random_uniform(2))
        }
        
        switch choice {
        case 0:
            sleeping()
        case 1:
            awake()
        case 2:
            thinking()
        default:
            break
        }
        
    }
}



