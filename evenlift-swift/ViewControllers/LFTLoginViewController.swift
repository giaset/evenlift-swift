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
        
        LFTSpotter.sharedInstance.makeSureUserIsLoggedIn(completion: {
            self.launchApp()
            })
    }
    
    func launchApp() {
        LFTSpotter.sharedInstance.showAlertWithTitle("Success", message: "Fuck yeah.")
    }
    
}
