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
        scrollview.pagingEnabled = true
        scrollview.showsHorizontalScrollIndicator = false
        
        let iphoneWidth: CGFloat = UIScreen.mainScreen().bounds.width
        let iphoneHeight: CGFloat = UIScreen.mainScreen().bounds.height
        
        let horizontalPadding: CGFloat = 25
        
        let buttonWidth: CGFloat = iphoneWidth-(2*horizontalPadding)
        let buttonHeight: CGFloat = buttonWidth
        
        let verticalPadding: CGFloat = (iphoneHeight/2)-(buttonHeight/2)-20
        
        // First tile (Bench)
        var benchTile = UIView(frame: CGRect(x: horizontalPadding, y: verticalPadding, width: buttonWidth, height: buttonHeight))
        styleTile(&benchTile, withTitle: "BENCH")
        scrollview.addSubview(benchTile)
        
        // Second tile (Squat)
        var squatTile = UIView(frame: CGRect(x: iphoneWidth+horizontalPadding, y: verticalPadding, width: buttonWidth, height: buttonHeight))
        styleTile(&squatTile, withTitle: "SQUAT")
        scrollview.addSubview(squatTile)
        
        // Third tile (Press)
        var pressTile = UIView(frame: CGRect(x: (2*iphoneWidth)+horizontalPadding, y: verticalPadding, width: buttonWidth, height: buttonHeight))
        styleTile(&pressTile, withTitle: "PRESS")
        scrollview.addSubview(pressTile)
        
        // Fourth tile (Deadlift)
        var dlTile = UIView(frame: CGRect(x: (3*iphoneWidth)+horizontalPadding, y: verticalPadding, width: buttonWidth, height: buttonHeight))
        styleTile(&dlTile, withTitle: "DEADLIFT")
        scrollview.addSubview(dlTile)
        
        scrollview.contentSize = CGSize(width: 4*iphoneWidth, height: 1)
        view.addSubview(scrollview)
    }
    
    func styleTile(inout tile: UIView, withTitle title: String) {
        var backgroundColor: UIColor
        switch title {
        case "BENCH":
            backgroundColor = UIColor(fromHexCode: "F3545B")
        case "SQUAT":
            backgroundColor = UIColor(fromHexCode: "628B85")
        case "PRESS":
            backgroundColor = UIColor(fromHexCode: "366387")
        case "DEADLIFT":
            backgroundColor = UIColor(fromHexCode: "FBDE5E")
        default:
            backgroundColor = darkColor
        }
        
        tile.backgroundColor = backgroundColor
        
        /* TITLE LABEL */
        var titleLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 0, height: 0))
        titleLabel.text = title
        titleLabel.textColor = UIColor.cloudsColor()
        titleLabel.font = UIFont.boldFlatFontOfSize(18)
        titleLabel.sizeToFit()
        titleLabel.frame.origin.x = (tile.frame.width/2) - (titleLabel.frame.width/2)
        tile.addSubview(titleLabel)
        
        /* 1RM LABEL */
        var repMaxLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        repMaxLabel.text = "275"
        repMaxLabel.textColor = UIColor.cloudsColor()
        repMaxLabel.font = UIFont.boldFlatFontOfSize(100)
        repMaxLabel.sizeToFit()
        repMaxLabel.frame.origin.x = (tile.frame.width/2) - (repMaxLabel.frame.width/2)
        repMaxLabel.frame.origin.y = (tile.frame.height/2) - (repMaxLabel.frame.height/2)
        tile.addSubview(repMaxLabel)
        
        /* UNIT LABEL */
        var unitLabel = UILabel(frame: CGRect(x: repMaxLabel.frame.maxX+2, y: repMaxLabel.frame.minY+20, width: 0, height: 0))
        unitLabel.text = "LBS"
        unitLabel.textColor = UIColor.cloudsColor()
        unitLabel.font = UIFont.flatFontOfSize(18)
        unitLabel.sizeToFit()
        tile.addSubview(unitLabel)
        
        /* PROGRESS VIEW */
        let progressViewMargin: CGFloat = 5
        let progressViewHeight: CGFloat = 10
        let progressViewMaxWidth = tile.frame.width-(2*progressViewMargin)
        let progressViewY = tile.frame.height-progressViewHeight-progressViewMargin
        var progressView = UIView(frame: CGRect(x: progressViewMargin, y: progressViewY, width: progressViewMaxWidth*0.625, height: progressViewHeight))
        progressView.backgroundColor = UIColor.cloudsColor()
        tile.addSubview(progressView)
        
        /* LITTLE NOTCHES ON PROGRESS VIEW */
        let notchWidth: CGFloat = 1
        let notchSpacing = progressViewMaxWidth/4
        
        var notch1 = UIView(frame: CGRect(x: progressViewMargin+notchSpacing, y: progressViewY, width: notchWidth, height: progressViewHeight))
        notch1.backgroundColor = backgroundColor
        tile.addSubview(notch1)
        
        var notch2 = UIView(frame: CGRect(x: progressViewMargin+(2*notchSpacing), y: progressViewY, width: notchWidth, height: progressViewHeight))
        notch2.backgroundColor = backgroundColor
        tile.addSubview(notch2)
    }
    
}
