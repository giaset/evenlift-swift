//
//  LFTMainViewController.swift
//  evenlift-swift
//
//  Created by Gianni Settino on 2014-08-22.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class LFTMainViewController: UIViewController {
    
    var darkColor = UIColor(fromHexCode: "303133")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Evenlift"
        
        view.backgroundColor = darkColor
        
        styleNavBar()
        setupButtons()
    }
    
    func styleNavBar() {
        navigationController.navigationBar.configureFlatNavigationBarWithColor(darkColor)
        var attributes = NSMutableDictionary(dictionary: navigationController.navigationBar.titleTextAttributes)
        attributes.setValue(UIFont.boldFlatFontOfSize(18), forKey: NSFontAttributeName)
        attributes.setValue(UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        navigationController.navigationBar.titleTextAttributes = attributes
    }
    
    func setupButtons() {
        let iphoneHeight = 568-64 // to account for status and nav bars
        let iphoneWidth = 320
        
        let padding = 10 // this value dictates everything!
        let buttonWidth = (iphoneWidth-(3*padding))/2
        let buttonHeight = buttonWidth
        
        // First button (Bench)
        var benchButton = FUIButton(frame: CGRect(x: padding, y: padding, width: buttonWidth, height: buttonHeight))
        styleButton(&benchButton, withTitle: "BENCH")
        view.addSubview(benchButton)
        
        // Second button (Squat)
        var squatButton = FUIButton(frame: CGRect(x: (2*padding)+buttonWidth, y: padding, width: buttonWidth, height: buttonHeight))
        styleButton(&squatButton, withTitle: "SQUAT")
        view.addSubview(squatButton)
        
        // Third button (Press)
        var pressButton = FUIButton(frame: CGRect(x: padding, y: (2*padding)+buttonHeight, width: buttonWidth, height: buttonHeight))
        styleButton(&pressButton, withTitle: "PRESS")
        view.addSubview(pressButton)
        
        // Fourth button (Deadlift)
        var dlButton = FUIButton(frame: CGRect(x: (2*padding)+buttonWidth, y: (2*padding)+buttonHeight, width: buttonWidth, height: buttonHeight))
        styleButton(&dlButton, withTitle: "DEADLIFT")
        view.addSubview(dlButton)
    }
    
    func styleButton(inout button: FUIButton, withTitle title: String) {
        button.buttonColor = UIColor.cloudsColor()
        button.cornerRadius = 1
        
        var highlightColor: UIColor
        switch title {
        case "BENCH":
            highlightColor = UIColor.alizarinColor()
        case "SQUAT":
            highlightColor = UIColor.nephritisColor()
        case "PRESS":
            highlightColor = UIColor.peterRiverColor()
        case "DEADLIFT":
            highlightColor = UIColor.sunflowerColor()
        default:
            highlightColor = darkColor
        }
        
        /* TITLE LABEL */
        var titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 0, height: 0))
        titleLabel.text = title
        titleLabel.textColor = highlightColor
        titleLabel.font = UIFont.boldFlatFontOfSize(14)
        titleLabel.sizeToFit()
        titleLabel.frame.origin.x = (button.frame.width/2) - (titleLabel.frame.width/2)
        button.addSubview(titleLabel)
        
        /* 1RM LABEL */
        var repMaxLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        repMaxLabel.text = "275"
        repMaxLabel.textColor = darkColor
        repMaxLabel.font = UIFont.boldFlatFontOfSize(72)
        repMaxLabel.sizeToFit()
        repMaxLabel.frame.origin.x = (button.frame.width/2) - (repMaxLabel.frame.width/2)
        repMaxLabel.frame.origin.y = (button.frame.height/2) - (repMaxLabel.frame.height/2)
        button.addSubview(repMaxLabel)
        
        /* PROGRESS VIEW */
        let progressViewHeight: CGFloat = 5
        var progressView = UIView(frame: CGRect(x: 3, y: button.frame.height-progressViewHeight-3, width: button.frame.width-15, height: progressViewHeight))
        progressView.backgroundColor = highlightColor
        progressView.layer.cornerRadius = 1
        button.addSubview(progressView)
    }
    
}
