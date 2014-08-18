//
//  LFTLoginViewController.swift
//  evenlift-swift
//
//  Created by Gianni Settino on 2014-08-18.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class LFTLoginViewController: UIViewController {
    
    var firebase = Firebase(url: "https://evenlift.firebaseio.com/")
    var authClient: FirebaseSimpleLogin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authClient = FirebaseSimpleLogin(ref: firebase)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Log user in if he isn't already
        authClient!.checkAuthStatusWithBlock({
            (error: NSError!, user: FAUser!) in
            if (error) {
                // there was an error
                self.showAlertWithTitle("Error", message: error.description)
            } else if (!user) {
                // user is not logged in
                self.login()
            } else {
                // user is logged in
                self.launchApp()
            }
            })
    }
    
    func login() {
        authClient!.loginToFacebookAppWithId("420007321469839", permissions: nil, audience: ACFacebookAudienceFriends, withCompletionBlock:{
            (error: NSError!, user: FAUser!) in
            if (error) {
                // there was an error
                self.showAlertWithTitle("Error", message: error.description)
            } else {
                // login successful
                self.launchApp()
            }
            })
    }
    
    func launchApp() {
        showAlertWithTitle("Success", message: "Fuck yeah.")
    }
    
    func showAlertWithTitle(title: String, message: String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}