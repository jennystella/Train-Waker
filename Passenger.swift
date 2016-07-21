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
    var sprite: SKSpriteNode
    
    init(sleepSign: SKSpriteNode, awakeSign: SKSpriteNode, thoughtCloud: SKSpriteNode, sprite: SKSpriteNode){
        self.sleepSign = sleepSign
        self.awakeSign = awakeSign
        self.thoughtCloud = thoughtCloud
        self.sprite = sprite
        sleeping()
    }
    
    func sleeping(){
        sleepSign.hidden = false
        awakeSign.hidden = true
        thoughtCloud.hidden = false
    }
    func awake(){
        sleepSign.hidden = true
        awakeSign.hidden = false
        thoughtCloud.hidden = false
    }
    
    func awaken(){
        sleepSign.hidden = true
        awakeSign.hidden = true
        thoughtCloud.hidden = true
        
    }
    
    func randomawake(){
        let choice = Int(arc4random_uniform(2))
        switch choice {
        case 0:
            sleeping()
        case 1:
            awake()
        default:
            break
        }
        
    }
}



