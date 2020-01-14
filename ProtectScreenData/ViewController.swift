//
//  ViewController.swift
//  ProtectScreenData
//
//  Created by Satyadev Chauhan on 24/12/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func blurButtonPressed(_ sender: Any) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        appDelegate.showBlurView()
        
        //after 2.5 secs perform unblur window
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            appDelegate.hideBlurView()
        }
    }
}

