//
//  HomeVC.swift
//  Swift-Animation-Cards
//
//  Created by Yura Chukhlib on 15.06.16.
//  Copyright © 2016 Yuri Chukhlib. All rights reserved.
//

import UIKit
import Spring

class HomeVC: UIViewController {

    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backgroundMaskView: UIView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var popoverView: UIView!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var favouritesLabel: UIImageView!

    struct Constants {
        static let screenWidth = UIScreen.mainScreen().bounds.width
        static let screenHeight = UIScreen.mainScreen().bounds.height
    }

    @IBAction func likeButtonDidPress(sender: UIButton) {
    }

    @IBAction func shareButtonDidPress(sender: UIButton) {
        shareView.hidden = false
        shareView.alpha = 0
        shareView.transform = CGAffineTransformMakeTranslation(0, 200)
        
        UIView.animateWithDuration(0.5, animations: {
            self.shareView.alpha = 1
            self.shareView.transform = CGAffineTransformMakeTranslation(0, 0)
        })
    }

    @IBAction func userButtonDidPress(sender: UIButton) {
        popoverView.hidden = false
        
        let scale = CGAffineTransformMakeScale(0.3, 0.3)
        let translate = CGAffineTransformMakeTranslation(50, -50)
        popoverView.transform = CGAffineTransformConcat(scale, translate)
        popoverView.alpha = 0
        
        UIView.animateWithDuration(0.3, animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.popoverView.transform = CGAffineTransformConcat(scale, translate)
            self.popoverView.alpha = 1
        })
    }
    
    @IBAction func imageButtonDidPress(sender: UIButton) {
        
        UIView.animateWithDuration(0.7, animations: {
            self.dialogView.layer.cornerRadius = 0
            self.dialogView.frame = CGRectMake(0, 0, Constants.screenWidth, Constants.screenHeight)
            let scale = self.imageButton.frame.height / self.imageButton.frame.width
            self.imageButton.frame = CGRectMake(0, 0, Constants.screenWidth, Constants.screenWidth * scale)
            self.likeButton.alpha = 0
            self.shareButton.alpha = 0
            self.userButton.alpha = 0
            self.headerView.alpha = 0
            }, completion: { finished in
                self.performSegueWithIdentifier("homeToDetail", sender: self)
        })
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insertBlurView(backgroundMaskView, style: UIBlurEffectStyle.Dark)
        insertBlurView(headerView, style: UIBlurEffectStyle.Dark)
        
        let scale = CGAffineTransformMakeScale(0.5, 0.5)
        let translate = CGAffineTransformMakeTranslation(0, -200)
        dialogView.transform = CGAffineTransformConcat(scale, translate)
        
        UIView.animateWithDuration(0.5, animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformConcat(scale, translate)
        })
        
    }
}
