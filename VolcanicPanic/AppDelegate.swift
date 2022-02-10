//
//  AppDelegate.swift
//  VolcanicPanic
//
//  Created by 64002170 on 2/7/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {

        var didHandleEvent = false
        for press in presses {
            guard let key = press.key else { continue }
            if key.charactersIgnoringModifiers == UIKeyCommand.inputLeftArrow || key.characters == "a" {
                hero.xScale = -1
                hero.physicsBody?.velocity=CGVector(dx: -200, dy: (hero.physicsBody?.velocity.dy)!)
                didHandleEvent = true
            }
//            else
                if key.charactersIgnoringModifiers == UIKeyCommand.inputRightArrow || key.characters == "d" {
                hero.xScale = 1
                hero.physicsBody?.velocity=CGVector(dx: 200, dy: (hero.physicsBody?.velocity.dy)!)
                didHandleEvent = true
            }
//            else
                if key.charactersIgnoringModifiers == UIKeyCommand.inputUpArrow || key.characters == "w" {
                if (hero.physicsBody?.velocity.dy==0){
                    hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 900))
                }
                didHandleEvent = true
            }
        }

        if didHandleEvent == false {
            // Didn't handle this key press, so pass the event to the next responder.
            super.pressesBegan(presses, with: event)
        }
    }
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {

        var didHandleEvent = false
        for press in presses {
            guard let key = press.key else { continue }
            if key.charactersIgnoringModifiers == UIKeyCommand.inputLeftArrow || key.characters == "a" {
                hero.physicsBody?.velocity=CGVector(dx: 0, dy: 0)
                didHandleEvent = true
            } else if key.charactersIgnoringModifiers == UIKeyCommand.inputRightArrow || key.characters == "d" {
                hero.physicsBody?.velocity=CGVector(dx: 0, dy: 0)
                didHandleEvent = true
            }
//            else if key.charactersIgnoringModifiers == UIKeyCommand.inputUpArrow || key.characters == "w" {
//                didHandleEvent = true
//            }
        }

        if didHandleEvent == false {
            // Didn't handle this key press, so pass the event to the next responder.
            super.pressesBegan(presses, with: event)
        }
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}

