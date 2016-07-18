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
    var sprite: SKSpriteNode
    
    init(sleepSign: SKSpriteNode, awakeSign: SKSpriteNode, sprite: SKSpriteNode){
        self.sleepSign = sleepSign
        self.awakeSign = awakeSign
        self.sprite = sprite
        sleeping()
    }
    
    func sleeping(){
        sleepSign.hidden = false
        awakeSign.hidden = true
    }
    func awake(){
        sleepSign.hidden = true
        awakeSign.hidden = false
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



