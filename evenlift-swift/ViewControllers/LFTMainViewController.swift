//
//  LFTMainViewController.swift
//  evenlift-swift
//
//  Created by Gianni Settino on 2014-08-22.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class LFTMainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Evenlift"
        
        view.backgroundColor = UIColor.cloudsColor()
        
        // Style the navBar
        navigationController.navigationBar.configureFlatNavigationBarWithColor(UIColor.midnightBlueColor())
        var attributes = NSMutableDictionary(dictionary: navigationController.navigationBar.titleTextAttributes)
        attributes.setValue(UIFont.boldFlatFontOfSize(18), forKey: NSFontAttributeName)
        attributes.setValue(UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        navigationController.navigationBar.titleTextAttributes = attributes
    }
    
}
