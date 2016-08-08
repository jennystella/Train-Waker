//
//  UserState.swift
//  Train Waker
//
//  Created by Jenny Kim on 8/1/16.
//  Copyright © 2016 Jenny Kim. All rights reserved.
//

import Foundation
import SpriteKit

/* Define properties to be stored in NSUserDefaults */
//extension DefaultsKeys {
//    static let highScore = DefaultsKey<Int>("highScore")
//    static let characters = DefaultsKey<NSData>("characters")
//}

class UserState {
    
    /* Swift Singleton */
    static let sharedInstance = UserState()
    
    var lastScene: String = "GameScene"
    var pause: Bool = false
    
//
////    var name: String = NSUserDefaults.standardUserDefaults().stringForKey("myName") ?? "User" {
////        didSet {
////            NSUserDefaults.standardUserDefaults().setObject(name, forKey:"myName")
////            // Saves to disk immediately, otherwise it will save when it has time
////            NSUserDefaults.standardUserDefaults().synchronize()
////        }
////    }
//    
//    var highScore: Int = NSUserDefaults.standardUserDefaults().integerForKey("myHighScore") ?? 0 {
//        didSet {
//            NSUserDefaults.standardUserDefaults().setInteger(highScore, forKey:"myHighScore")
//            // Saves to disk immediately, otherwise it will save when it has time
//            NSUserDefaults.standardUserDefaults().synchronize()
//        }
//    }
//    
    var tutorialOptional: Bool = NSUserDefaults.standardUserDefaults().boolForKey("myTutorial") ?? false {
        didSet{
            NSUserDefaults.standardUserDefaults().setBool(tutorialOptional, forKey: "myTutorial")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}