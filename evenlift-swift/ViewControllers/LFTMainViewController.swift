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
        
        view.backgroundColor = darkColor
        
        navigationController.navigationBarHidden = true
        
        setupButtons()
        setupStatusBar()
    }
    
    func setupStatusBar() {
        var statusBarView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 20))
        statusBarView.backgroundColor = darkColor
        view.addSubview(statusBarView)
    }
    
    func setupButtons() {
        var scrollview = UIScrollView(frame: view.frame)
        scrollview.showsVerticalScrollIndicator = false
        
        let iphoneWidth: CGFloat = 320
        
        let horizontalPadding: CGFloat = 10
        let verticalPadding: CGFloat = 10
        let buttonWidth: CGFloat = iphoneWidth-(2*horizontalPadding)
        let buttonHeight: CGFloat = CGFloat(buttonWidth)*0.75
        
        // First button (Bench)
        var benchButton = FUIButton(frame: CGRect(x: horizontalPadding, y: verticalPadding, width: buttonWidth, height: buttonHeight))
        styleButton(&benchButton, withTitle: "BENCH")
        scrollview.addSubview(benchButton)
        
        // Second button (Squat)
        var squatButton = FUIButton(frame: CGRect(x: horizontalPadding, y: buttonHeight+(2*verticalPadding), width: buttonWidth, height: buttonHeight))
        styleButton(&squatButton, withTitle: "SQUAT")
        scrollview.addSubview(squatButton)
        
        // Third button (Press)
        var pressButton = FUIButton(frame: CGRect(x: horizontalPadding, y: (2*buttonHeight)+(3*verticalPadding), width: buttonWidth, height: buttonHeight))
        styleButton(&pressButton, withTitle: "PRESS")
        scrollview.addSubview(pressButton)
        
        // Fourth button (Deadlift)
        var dlButton = FUIButton(frame: CGRect(x: horizontalPadding, y: (3*buttonHeight)+(4*verticalPadding), width: buttonWidth, height: buttonHeight))
        styleButton(&dlButton, withTitle: "DEADLIFT")
        scrollview.addSubview(dlButton)
        
        scrollview.contentSize = CGSize(width: iphoneWidth, height: (4*buttonHeight)+(5*verticalPadding))
        view.addSubview(scrollview)
    }
    
    func styleButton(inout button: FUIButton, withTitle title: String) {
        button.buttonColor = UIColor.cloudsColor()
        button.highlightedColor = UIColor.silverColor()
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
        
        button.buttonColor = highlightColor
        
        /* TITLE LABEL */
        var titleLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 0, height: 0))
        titleLabel.text = title
        titleLabel.textColor = UIColor.cloudsColor()
        titleLabel.font = UIFont.boldFlatFontOfSize(18)
        titleLabel.sizeToFit()
        titleLabel.frame.origin.x = (button.frame.width/2) - (titleLabel.frame.width/2)
        button.addSubview(titleLabel)
        
        /* 1RM LABEL */
        var repMaxLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        repMaxLabel.text = "275"
        repMaxLabel.textColor = UIColor.cloudsColor()
        repMaxLabel.font = UIFont.boldFlatFontOfSize(100)
        repMaxLabel.sizeToFit()
        repMaxLabel.frame.origin.x = (button.frame.width/2) - (repMaxLabel.frame.width/2)
        repMaxLabel.frame.origin.y = (button.frame.height/2) - (repMaxLabel.frame.height/2)
        button.addSubview(repMaxLabel)
        
        /* PROGRESS VIEW */
        let progressViewMargin: CGFloat = 5
        let progressViewHeight: CGFloat = 10
        let progressViewMaxWidth = button.frame.width-(2*progressViewMargin)
        let progressViewY = button.frame.height-progressViewHeight-progressViewMargin
        var progressView = UIView(frame: CGRect(x: progressViewMargin, y: progressViewY, width: progressViewMaxWidth*0.625, height: progressViewHeight))
        progressView.backgroundColor = UIColor.cloudsColor()
        progressView.layer.cornerRadius = 1
        button.addSubview(progressView)
        
        /* LITTLE NOTCHES ON PROGRESS VIEW */
        let notchWidth: CGFloat = 1
        let notchSpacing = progressViewMaxWidth/4
        
        var notch1 = UIView(frame: CGRect(x: progressViewMargin+notchSpacing, y: progressViewY, width: notchWidth, height: progressViewHeight))
        notch1.backgroundColor = highlightColor
        button.addSubview(notch1)
        
        var notch2 = UIView(frame: CGRect(x: progressViewMargin+(2*notchSpacing), y: progressViewY, width: notchWidth, height: progressViewHeight))
        notch2.backgroundColor = highlightColor
        button.addSubview(notch2)
    }
    
}
