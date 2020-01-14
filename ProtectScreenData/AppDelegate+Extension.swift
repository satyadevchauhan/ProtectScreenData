//
//  AppDelegate+Extension.swift
//  ProtectScreenData
//
//  Created by Satyadev Chauhan on 24/12/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

import UIKit

//Random blur TAG
private let blurViewtag = 999999

extension AppDelegate {
    
    //Show blur view
    func showBlurView() {
        
        //return if blured view is applied already
        if (window?.viewWithTag(blurViewtag) != nil){
            return
        }
        
        let snapshot = bluredSnapshot()
        window?.addSubview(snapshot!)
    }
    
    //Remove blur view
    func hideBlurView() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.window?.viewWithTag(blurViewtag)?.removeFromSuperview()
        }
    }
    
    func bluredSnapshot() -> UIView? {
        //take window snapshot and apply blurView to it
        guard let snapshot = window?.snapshotView(afterScreenUpdates: true) else { return nil }
        snapshot.addSubview(blurView(frame: snapshot.frame))
        snapshot.tag = blurViewtag
        return snapshot
    }
    
    func blurView(frame: CGRect) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        view.frame = frame
        return view
    }
}
