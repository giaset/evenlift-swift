//
//  LFTHelpers.swift
//  evenlift-swift
//
//  Created by Gianni Settino on 2014-08-19.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class LFTHelpers {
    
    class func showAlertWithTitle(title: String, message: String) {
        // Support for UIAlertViews, which are deprecated starting in iOS8
        var alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle("Ok")
        
        alert.show()
    }
    
}