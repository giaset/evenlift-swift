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
        
        styleNavBar()
        setupButtons()
    }
    
    func styleNavBar() {
        navigationController.navigationBar.configureFlatNavigationBarWithColor(UIColor.midnightBlueColor())
        var attributes = NSMutableDictionary(dictionary: navigationController.navigationBar.titleTextAttributes)
        attributes.setValue(UIFont.boldFlatFontOfSize(18), forKey: NSFontAttributeName)
        attributes.setValue(UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        navigationController.navigationBar.titleTextAttributes = attributes
    }
    
    func setupButtons() {
        let iphoneHeight = 568-64 // to account for status and nav bars
        let iphoneWidth = 320
        
        let padding = 10 // this value dictates everything!
        let otherButtonHeight = 44
        let buttonWidth = (iphoneWidth-(3*padding))/2
        let buttonHeight = (iphoneHeight-(4*padding)-otherButtonHeight)/2
        
        // First button (Bench)
        var benchButton = FUIButton(frame: CGRect(x: padding, y: padding, width: buttonWidth, height: buttonHeight))
        styleButton(&benchButton)
        benchButton.setTitle("BENCH", forState: .Normal)
        view.addSubview(benchButton)
        
        // Second button (Squat)
        var squatButton = FUIButton(frame: CGRect(x: (2*padding)+buttonWidth, y: padding, width: buttonWidth, height: buttonHeight))
        styleButton(&squatButton)
        squatButton.setTitle("SQUAT", forState: .Normal)
        view.addSubview(squatButton)
        
        // Third button (Press)
        var pressButton = FUIButton(frame: CGRect(x: padding, y: (2*padding)+buttonHeight, width: buttonWidth, height: buttonHeight))
        styleButton(&pressButton)
        pressButton.setTitle("PRESS", forState: .Normal)
        view.addSubview(pressButton)
        
        // Fourth button (Deadlift)
        var dlButton = FUIButton(frame: CGRect(x: (2*padding)+buttonWidth, y: (2*padding)+buttonHeight, width: buttonWidth, height: buttonHeight))
        styleButton(&dlButton)
        dlButton.setTitle("DEADLIFT", forState: .Normal)
        view.addSubview(dlButton)
        
        // Bottom button (Other)
        var otherButton = FUIButton(frame: CGRect(x: padding, y: (3*padding)+(2*buttonHeight), width: iphoneWidth-(2*padding), height: otherButtonHeight))
        styleButton(&otherButton)
        otherButton.buttonColor = UIColor.peterRiverColor()
        otherButton.shadowColor = UIColor.belizeHoleColor()
        otherButton.setTitle("OTHER", forState: .Normal)
        view.addSubview(otherButton)
    }
    
    func styleButton(inout button: FUIButton) {
        button.buttonColor = UIColor.turquoiseColor()
        button.shadowColor = UIColor.greenSeaColor()
        button.shadowHeight = 3
        button.cornerRadius = 6
        button.titleLabel.font = UIFont.boldFlatFontOfSize(20)
        button.setTitleColor(UIColor.cloudsColor(), forState: .Normal)
    }
    
}
