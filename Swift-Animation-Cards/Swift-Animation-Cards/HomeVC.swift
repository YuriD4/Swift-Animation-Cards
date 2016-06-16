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
    @IBOutlet weak var maskButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var shareLabelsView: UIView!

    struct Constants {
        static let screenWidth = UIScreen.mainScreen().bounds.width
        static let screenHeight = UIScreen.mainScreen().bounds.height
    }
    
    @IBAction func maskButtonDidPress(sender: UIButton) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.maskButton.alpha = 0
        }, completion: nil)
        hideShareView()
        hidePopover()
    }
    
    func showMask() {
        maskButton.hidden = false
        maskButton.alpha = 0
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.maskButton.alpha = 1
        }, completion: nil)
    }

    @IBAction func likeButtonDidPress(sender: UIButton) {
    }

    @IBAction func shareButtonDidPress(sender: UIButton) {
        shareView.hidden = false
        showMask()
        shareView.transform = CGAffineTransformMakeTranslation(0, 200)
        emailButton.transform = CGAffineTransformMakeTranslation(0, 200)
        twitterButton.transform = CGAffineTransformMakeTranslation(0, 200)
        facebookButton.transform = CGAffineTransformMakeTranslation(0, 200)
        shareLabelsView.alpha = 0
        shareView.alpha = 1
        maskButton.alpha = 1
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.shareView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformMakeScale(0.8, 0.8)
        }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.emailButton.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.twitterButton.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.facebookButton.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.shareLabelsView.alpha = 1
        }, completion: nil)
    }
    
    func hideShareView() {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.shareView.transform = CGAffineTransformMakeTranslation(0, 200)
            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
            self.maskButton.hidden = true
            self.shareView.alpha = 0
        }, completion: nil)
    }

    @IBAction func userButtonDidPress(sender: UIButton) {
        popoverView.hidden = false
        
        let scale = CGAffineTransformMakeScale(0.3, 0.3)
        let translate = CGAffineTransformMakeTranslation(50, -50)
        popoverView.transform = CGAffineTransformConcat(scale, translate)
        popoverView.alpha = 0
        
        showMask()
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.popoverView.transform = CGAffineTransformConcat(scale, translate)
            self.popoverView.alpha = 1
        }, completion: nil)

    }
    
    func hidePopover() {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.popoverView.hidden = true
        }, completion: nil)
    }
    
    @IBAction func imageButtonDidPress(sender: UIButton) {

        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.dialogView.layer.cornerRadius = 0
            self.dialogView.frame = CGRectMake(0, 0, Constants.screenWidth, Constants.screenHeight)
            let scale = self.imageButton.frame.height / self.imageButton.frame.width
            self.imageButton.frame = CGRectMake(0, 0, Constants.screenWidth, Constants.screenWidth * scale)
            self.likeButton.alpha = 0
            self.shareButton.alpha = 0
            self.userButton.alpha = 0
            self.headerView.alpha = 0
            }, completion: {finished in
                self.performSegueWithIdentifier("homeToDetail", sender: self)
        })

    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func setDialogViewStartView(){
        let scale = CGAffineTransformMakeScale(0.5, 0.5)
        let translate = CGAffineTransformMakeTranslation(0, -200)
        dialogView.center = view.center
        dialogView.transform = CGAffineTransformConcat(scale, translate)
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformConcat(scale, translate)
        }, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insertBlurView(backgroundMaskView, style: UIBlurEffectStyle.Dark)
        insertBlurView(headerView, style: UIBlurEffectStyle.Dark)
        setDialogViewStartView()
        
        animator = UIDynamicAnimator(referenceView: view)
        
    }
    
    
    var animator : UIDynamicAnimator!
    var attachmentBehavior : UIAttachmentBehavior!
    var gravityBehavior : UIGravityBehavior!
    var snapBehavior : UISnapBehavior!
    
    @IBOutlet var panRecognizer: UIPanGestureRecognizer!
    @IBAction func handleGesture(sender: UIPanGestureRecognizer) {
        let location = sender.locationInView(view)
        let boxLocation = sender.locationInView(dialogView)
        
        switch sender.state {
        case .Began:
            self.animator.removeAllBehaviors()
            
            let centerOffset = UIOffsetMake(boxLocation.x - CGRectGetMidX(dialogView.bounds), boxLocation.y - CGRectGetMidY(dialogView.bounds))
            attachmentBehavior = UIAttachmentBehavior(item: dialogView, offsetFromCenter: centerOffset, attachedToAnchor: location)
            attachmentBehavior.frequency = 0
            
            animator.addBehavior(attachmentBehavior)
        case .Changed:
            attachmentBehavior.anchorPoint = location
        case .Ended:
            animator.removeBehavior(attachmentBehavior)
            
            snapBehavior = UISnapBehavior(item: dialogView, snapToPoint: view.center)
            animator.addBehavior(snapBehavior)
        default:
            break
        }
        
    }
    
}













































