//
//  OBProgressHUD.swift
//  Runner
//
//  Created by Tmoson on 2022/2/12.
//

import Foundation
import MBProgressHUD
import UIKit
import Lottie

class OBProgressHUD : NSObject {
    static func showMessage(text: String) -> Void {
        
        var view: Optional<UIWindow>
        if #available(iOS 13.0, *) {
            view = UIApplication.shared.windows[0]
        } else {
            view = UIApplication.shared.keyWindow
        }
        if (view != nil) {
            MBProgressHUD.hide(for: view!, animated: false)
            let hud: MBProgressHUD = MBProgressHUD.showAdded(to: view!, animated: true)
            hud.isUserInteractionEnabled = true
            hud.label.text = "  \(text)  "
            hud.label.numberOfLines = 0
            hud.mode = .text
            hud.margin = 10.0
            hud.bezelView.layer.cornerRadius = 20.0
            hud.bezelView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
            hud.bezelView.layer.borderWidth = 1.0
            hud.label.font = UIFont.systemFont(ofSize: 16)
            hud.bezelView.style = .solidColor
            hud.bezelView.color = UIColor.black.withAlphaComponent(0.4)
            hud.contentColor = UIColor.white
            hud.isSquare = false
            hud.hide(animated: true, afterDelay: 2)
        }
    }
    
    static func showLoading(text: String) -> Void {
        
        var view: Optional<UIWindow>
        if #available(iOS 13.0, *) {
            view = UIApplication.shared.windows[0]
        } else {
            view = UIApplication.shared.keyWindow
        }
        if (view != nil) {
            MBProgressHUD.hide(for: view!, animated: false)
            let hud: MBProgressHUD = MBProgressHUD.showAdded(to: view!, animated: true)
            hud.isUserInteractionEnabled = true
            let animationView = AnimationView(name: "loading")
            animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            animationView.loopMode = .loop
            animationView.play { (isFinished) in
                // 动画执行完成后的回调
                // Do Something
            }
            hud.customView = animationView
            hud.label.text = text
            hud.label.numberOfLines = 0
            hud.mode = .customView
            hud.label.font = UIFont.systemFont(ofSize: 16)
            hud.bezelView.style = .solidColor
            hud.bezelView.color = UIColor.black.withAlphaComponent(0.4)
            hud.contentColor = UIColor.white
            hud.isSquare = false
            hud.hide(animated: true, afterDelay: 8)
        }
    }
    
    static func dismissLoading() -> Void {
        
        var view: Optional<UIWindow>
        if #available(iOS 13.0, *) {
            view = UIApplication.shared.windows[0]
        } else {
            view = UIApplication.shared.keyWindow
        }
        if (view != nil) {
            MBProgressHUD.hide(for: view!, animated: true)
        }
    }
}

class WindowPlus : NSObject {
    static func curKeyWindow() -> UIWindow? {
        var window: Optional<UIWindow>
        if #available(iOS 13.0, *) {
            window = UIApplication.shared.windows[0]
        } else {
            window = UIApplication.shared.keyWindow
        }
        return window
    }
    
    static func topHeight() -> CGFloat {
        var height = curKeyWindow()?.safeAreaInsets.top ?? 0.0
        if height == 0 { height = 20.0 }
        return height
    }
}
