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
        
        let buttonHeight = iphoneHeight/4
        
        // First button (Bench)
        var benchButton = FUIButton(frame: CGRect(x: 0, y: 0, width: iphoneWidth, height: buttonHeight))
        styleButton(&benchButton, withTitle: "BENCH")
        benchButton.buttonColor = UIColor.peterRiverColor()
        benchButton.highlightedColor = UIColor.belizeHoleColor()
        view.addSubview(benchButton)
        
        // Second button (Squat)
        var squatButton = FUIButton(frame: CGRect(x: 0, y: buttonHeight, width: iphoneWidth, height: buttonHeight))
        styleButton(&squatButton, withTitle: "SQUAT")
        squatButton.buttonColor = UIColor.turquoiseColor()
        squatButton.highlightedColor = UIColor.greenSeaColor()
        view.addSubview(squatButton)
        
        // Third button (Press)
        var pressButton = FUIButton(frame: CGRect(x: 0, y: 2*buttonHeight, width: iphoneWidth, height: buttonHeight))
        styleButton(&pressButton, withTitle: "PRESS")
        pressButton.buttonColor = UIColor.alizarinColor()
        pressButton.highlightedColor = UIColor.pomegranateColor()
        view.addSubview(pressButton)
        
        // Fourth button (Deadlift)
        var dlButton = FUIButton(frame: CGRect(x: 0, y: 3*buttonHeight, width: iphoneWidth, height: buttonHeight))
        styleButton(&dlButton, withTitle: "DEADLIFT")
        dlButton.buttonColor = UIColor.amethystColor()
        dlButton.highlightedColor = UIColor.wisteriaColor()
        view.addSubview(dlButton)
    }
    
    func styleButton(inout button: FUIButton, withTitle title: String) {
        var titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 0, height: 0))
        titleLabel.text = title
        titleLabel.textColor = UIColor.cloudsColor()
        titleLabel.font = UIFont.boldFlatFontOfSize(12)
        titleLabel.sizeToFit()
        titleLabel.frame.origin.x = (button.frame.width/2) - (titleLabel.frame.width/2)
        button.addSubview(titleLabel)
    }
    
}
