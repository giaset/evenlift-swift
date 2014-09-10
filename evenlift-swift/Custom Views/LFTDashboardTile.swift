//
//  LFTDashboardTile.swift
//  evenlift-swift
//
//  Created by Gianni Settino on 2014-09-01.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class LFTDashboardTile: UIView {
    
    func styleForExercise(exercise: String) {
        var backgroundColor: UIColor
        var highlightColor = UIColor.whiteColor()
        
        switch exercise {
        case "BENCH":
            backgroundColor = UIColor(fromHexCode: "4aa8d8")
        case "SQUAT":
            backgroundColor = UIColor(fromHexCode: "56bc8a")
        case "DEADLIFT":
            backgroundColor = UIColor(fromHexCode: "d95e40")
        default:
            backgroundColor = UIColor.whiteColor()
            highlightColor = UIColor(fromHexCode: "3b4c61")
        }
        
        self.backgroundColor = backgroundColor
        
        /* TITLE LABEL */
        var titleLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 0, height: 0))
        titleLabel.text = exercise
        titleLabel.textColor = highlightColor
        titleLabel.font = UIFont.boldFlatFontOfSize(18)
        titleLabel.sizeToFit()
        titleLabel.frame.origin.x = (frame.width/2) - (titleLabel.frame.width/2)
        addSubview(titleLabel)
        
        /* 1RM LABEL */
        var repMaxLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        repMaxLabel.text = "333"
        repMaxLabel.textColor = highlightColor
        repMaxLabel.font = UIFont.boldFlatFontOfSize(100)
        repMaxLabel.sizeToFit()
        repMaxLabel.frame.origin.x = (frame.width/2) - (repMaxLabel.frame.width/2)
        repMaxLabel.frame.origin.y = (frame.height/2) - (repMaxLabel.frame.height/2)
        addSubview(repMaxLabel)
        
        /* UNIT LABEL */
        var unitLabel = UILabel(frame: CGRect(x: repMaxLabel.frame.maxX+2, y: repMaxLabel.frame.minY+20, width: 0, height: 0))
        unitLabel.text = "LBS"
        unitLabel.textColor = highlightColor
        unitLabel.font = UIFont.flatFontOfSize(18)
        unitLabel.sizeToFit()
        addSubview(unitLabel)
        
        /* PROGRESS VIEW SKELETON */
        let progressViewMargin: CGFloat = 10
        let progressViewHeight: CGFloat = 10
        let progressViewMaxWidth = frame.width-(2*progressViewMargin)
        let progressViewY = frame.height-progressViewHeight-progressViewMargin
        var progressView = UIView(frame: CGRect(x: progressViewMargin, y: progressViewY, width: progressViewMaxWidth, height: progressViewHeight))
        progressView.layer.borderColor = highlightColor.CGColor
        progressView.layer.borderWidth = 1
        addSubview(progressView)
        
        /* ACTUAL PROGRESS BAR */
        let percentage: CGFloat = 0.625
        var progressBar = UIView(frame: CGRect(x: progressViewMargin, y: progressViewY, width: progressViewMaxWidth*percentage, height: progressViewHeight))
        progressBar.backgroundColor = highlightColor
        addSubview(progressBar)
        
        /* LITTLE NOTCHES ON PROGRESS VIEW */
        let notchWidth: CGFloat = 1
        let notchSpacing = progressViewMaxWidth/4
        
        var notch1 = UIView(frame: CGRect(x: progressViewMargin+notchSpacing, y: progressViewY, width: notchWidth, height: progressViewHeight))
        notch1.backgroundColor = backgroundColor
        addSubview(notch1)
        
        var notch2 = UIView(frame: CGRect(x: progressViewMargin+(2*notchSpacing), y: progressViewY, width: notchWidth, height: progressViewHeight))
        notch2.backgroundColor = backgroundColor
        addSubview(notch2)
        
        var notch3 = UIView(frame: CGRect(x: progressViewMargin+(3*notchSpacing), y: progressViewY, width: notchWidth, height: progressViewHeight))
        notch3.backgroundColor = highlightColor
        addSubview(notch3)

    }
    
}
