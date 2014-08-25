//
//  LFTSpotter.swift
//  evenlift-swift
//
//  Created by Gianni Settino on 2014-08-19.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class LFTSpotter: NSObject {
    
    /* Global Variables */
    let url = "https://evenlift.firebaseio.com/"
    var firebase: Firebase
    var authClient: FirebaseSimpleLogin
    let facebookAppId = "420007321469839"
    
    /* Singleton */
    class var sharedInstance: LFTSpotter {
    struct Static {
        static let instance: LFTSpotter = LFTSpotter()
        }
        return Static.instance
    }
    
    override init() {
        firebase = Firebase(url: url)
        authClient = FirebaseSimpleLogin(ref: firebase)
        
        super.init()
    }
    
    func makeSureUserIsLoggedIn(#completion: () -> ()) {
        // Log user in if he isn't already
        authClient.checkAuthStatusWithBlock({
            (error: NSError!, user: FAUser!) in
            if (error != nil) {
                // there was an error
                self.showAlertWithTitle("Error", message: error.description)
            } else if (user == nil) {
                // user is not logged in
                self.loginWithCompletion({
                    user in
                    completion()
                    })
            } else {
                // user is logged in
                completion()
            }
            })
    }
    
    func loginWithCompletion(completion: (FAUser!) -> ()) {
        authClient.loginToFacebookAppWithId(facebookAppId, permissions: nil, audience: ACFacebookAudienceOnlyMe, withCompletionBlock:{
            (error: NSError!, user: FAUser!) in
            if (error != nil) {
                // there was an error
                self.showAlertWithTitle("Error", message: error.description)
            } else {
                // login successful
                completion(user)
            }
            })
    }
    
    func showAlertWithTitle(title: String, message: String) {
        // Support for UIAlertViews, which are deprecated starting in iOS8
        var alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle("Ok")
        
        alert.show()
    }
    
    /* User ID */
    func userId() -> String? {
        return NSUserDefaults.standardUserDefaults().stringForKey("uid")
    }
    
}