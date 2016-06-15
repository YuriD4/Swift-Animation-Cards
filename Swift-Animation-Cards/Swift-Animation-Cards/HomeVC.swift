//
//  HomeVC.swift
//  Swift-Animation-Cards
//
//  Created by Yura Chukhlib on 15.06.16.
//  Copyright © 2016 Yuri Chukhlib. All rights reserved.
//

import UIKit

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


    @IBAction func likeButtonDidPress(sender: UIButton) {
    }

    @IBAction func shareButtonDidPress(sender: UIButton) {
        shareView.hidden = false
    }

    @IBAction func userButtonDidPress(sender: UIButton) {
        popoverView.hidden = false
    }
    
    @IBAction func imageButtonDidPress(sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
