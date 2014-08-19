//
//  LFTLoginViewController.swift
//  evenlift-swift
//
//  Created by Gianni Settino on 2014-08-18.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class LFTLoginViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        /*LFTSpotter.sharedInstance.makeSureUserIsLoggedIn(completion: {
            self.launchApp()
            })*/
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        launchApp()
    }
    
    func launchApp() {
        var workouts = LFTWorkoutsViewController(style: .Grouped)
        var workoutsNavController = UINavigationController(rootViewController: workouts)
        
        var exercises = LFTExercisesViewController(style: .Grouped)
        var exercisesNavController = UINavigationController(rootViewController: exercises)
        
        var controllers = NSMutableArray()
        controllers.addObject(workoutsNavController)
        controllers.addObject(exercisesNavController)
        
        var tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        
        self.presentViewController(tabBarController, animated: false, completion: nil)
    }
    
}
