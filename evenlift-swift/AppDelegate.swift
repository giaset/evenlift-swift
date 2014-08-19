//
//  AppDelegate.swift
//  evenlift-swift
//
//  Created by Gianni Settino on 2014-08-18.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Stylin'
        UINavigationBar.appearance().translucent = false
        UITabBar.appearance().translucent = false
        UITabBar.appearance().tintColor = UIColor.redColor()
        
        self.window!.rootViewController = LFTLoginViewController()
        
        self.window!.makeKeyAndVisible()
        return true
    }

}

