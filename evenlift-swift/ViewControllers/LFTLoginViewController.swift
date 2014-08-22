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
        presentViewController(UINavigationController(rootViewController: LFTMainViewController()), animated: false, completion: nil)
    }
    
}
