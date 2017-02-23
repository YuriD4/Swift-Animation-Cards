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
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height
    }
    
    @IBAction func maskButtonDidPress(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.maskButton.alpha = 0
        }, completion: nil)
        hideShareView()
        hidePopover()
    }
    
    func showMask() {
        maskButton.isHidden = false
        maskButton.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.maskButton.alpha = 1
        }, completion: nil)
    }

    @IBAction func likeButtonDidPress(_ sender: UIButton) {
    }

    @IBAction func shareButtonDidPress(_ sender: UIButton) {
        shareView.isHidden = false
        showMask()
        shareView.transform = CGAffineTransform(translationX: 0, y: 200)
        emailButton.transform = CGAffineTransform(translationX: 0, y: 200)
        twitterButton.transform = CGAffineTransform(translationX: 0, y: 200)
        facebookButton.transform = CGAffineTransform(translationX: 0, y: 200)
        shareLabelsView.alpha = 0
        shareView.alpha = 1
        maskButton.alpha = 1
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.shareView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.dialogView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.emailButton.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.twitterButton.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.facebookButton.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.shareLabelsView.alpha = 1
        }, completion: nil)
    }
    
    func hideShareView() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.shareView.transform = CGAffineTransform(translationX: 0, y: 200)
            self.dialogView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.maskButton.isHidden = true
            self.shareView.alpha = 0
        }, completion: nil)
    }

    @IBAction func userButtonDidPress(_ sender: UIButton) {
        popoverView.isHidden = false
        
        let scale = CGAffineTransform(scaleX: 0.3, y: 0.3)
        let translate = CGAffineTransform(translationX: 50, y: -50)
        popoverView.transform = scale.concatenating(translate)
        popoverView.alpha = 0
        
        showMask()
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            let scale = CGAffineTransform(scaleX: 1, y: 1)
            let translate = CGAffineTransform(translationX: 0, y: 0)
            self.popoverView.transform = scale.concatenating(translate)
            self.popoverView.alpha = 1
        }, completion: nil)

    }
    
    func hidePopover() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.popoverView.isHidden = true
        }, completion: nil)
    }
    
    @IBAction func imageButtonDidPress(_ sender: UIButton) {

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.dialogView.layer.cornerRadius = 0
            self.dialogView.frame = CGRect(x: 0, y: 0, width: Constants.screenWidth, height: Constants.screenHeight)
            let scale = self.imageButton.frame.height / self.imageButton.frame.width
            self.imageButton.frame = CGRect(x: 0, y: 0, width: Constants.screenWidth, height: Constants.screenWidth * scale)
            self.likeButton.alpha = 0
            self.shareButton.alpha = 0
            self.userButton.alpha = 0
            self.headerView.alpha = 0
            }, completion: {finished in
                self.performSegue(withIdentifier: "homeToDetail", sender: self)
        })

    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func setDialogViewStartView(){
        let scale = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let translate = CGAffineTransform(translationX: 0, y: -200)
        dialogView.center = view.center
        dialogView.transform = scale.concatenating(translate)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            let scale = CGAffineTransform(scaleX: 1, y: 1)
            let translate = CGAffineTransform(translationX: 0, y: 0)
            self.dialogView.transform = scale.concatenating(translate)
        }, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insertBlurView(view: backgroundMaskView, style: UIBlurEffectStyle.dark)
        insertBlurView(view: headerView, style: UIBlurEffectStyle.dark)
        setDialogViewStartView()
        
        animator = UIDynamicAnimator(referenceView: view)
        
    }
    
    
    var animator : UIDynamicAnimator!
    var attachmentBehavior : UIAttachmentBehavior!
    var gravityBehavior : UIGravityBehavior!
    var snapBehavior : UISnapBehavior!
    
    @IBOutlet var panRecognizer: UIPanGestureRecognizer!
    @IBAction func handleGesture(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let boxLocation = sender.location(in: dialogView)
        
        switch sender.state {
        case .began:
            self.animator.removeAllBehaviors()
            
            let centerOffset = UIOffsetMake(boxLocation.x - dialogView.bounds.midX, boxLocation.y - dialogView.bounds.midY)
            attachmentBehavior = UIAttachmentBehavior(item: dialogView, offsetFromCenter: centerOffset, attachedToAnchor: location)
            attachmentBehavior.frequency = 0
            
            animator.addBehavior(attachmentBehavior)
        case .changed:
            attachmentBehavior.anchorPoint = location
        case .ended:
            animator.removeBehavior(attachmentBehavior)
            
            snapBehavior = UISnapBehavior(item: dialogView, snapTo: view.center)
            animator.addBehavior(snapBehavior)
        default:
            break
        }
        
    }
    
}













































