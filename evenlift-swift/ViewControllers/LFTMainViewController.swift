//
//  LFTMainViewController.swift
//  evenlift-swift
//
//  Created by Gianni Settino on 2014-08-22.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class LFTMainViewController: UIViewController {
    
    var darkColor = UIColor(fromHexCode: "3b4c61")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = darkColor
        
        navigationController.navigationBarHidden = true
        
        setupButtons()
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
        
        let verticalPadding: CGFloat = (iphoneHeight/2)-(buttonHeight/2)-20 // - 20 for the status bar
        
        // First tile (Bench)
        var benchTile = LFTDashboardTile(frame: CGRect(x: horizontalPadding, y: verticalPadding, width: buttonWidth, height: buttonHeight))
        benchTile.styleForExercise("BENCH")
        scrollview.addSubview(benchTile)
        
        // Second tile (Squat)
        var squatTile = LFTDashboardTile(frame: CGRect(x: iphoneWidth+horizontalPadding, y: verticalPadding, width: buttonWidth, height: buttonHeight))
        squatTile.styleForExercise("SQUAT")
        scrollview.addSubview(squatTile)
        
        // Third tile (Press)
        var pressTile = LFTDashboardTile(frame: CGRect(x: (2*iphoneWidth)+horizontalPadding, y: verticalPadding, width: buttonWidth, height: buttonHeight))
        pressTile.styleForExercise("PRESS")
        scrollview.addSubview(pressTile)
        
        // Fourth tile (Deadlift)
        var dlTile = LFTDashboardTile(frame: CGRect(x: (3*iphoneWidth)+horizontalPadding, y: verticalPadding, width: buttonWidth, height: buttonHeight))
        dlTile.styleForExercise("DEADLIFT")
        scrollview.addSubview(dlTile)
        
        scrollview.contentSize = CGSize(width: 4*iphoneWidth, height: 1)
        view.addSubview(scrollview)
    }
    
}
