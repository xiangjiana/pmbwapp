//
//  OBAnimateButton.swift
//  Runner
//
//  Created by leishen on 2022/2/28.
//

import Foundation
import Lottie
import UIKit
import Masonry

@objcMembers public class OBAnimateButton: UIButton {
    
    @objc var lottieView: AnimationView?
    
    @objc convenience init(image name: String) {
        self.init()
        self.lottieView = AnimationView(animation: Animation.named(name))
        self.lottieView?.isUserInteractionEnabled = false
        if let lottieView = lottieView {
            self.addSubview(lottieView)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.lottieView?.frame = .init(x:(self.bounds.width - 24) / 2.0, y: (self.bounds.height - 24) / 2.0, width: 24, height: 24)
    }
    
    
    @objc func play(loopMode: Bool, completion: LottieCompletionBlock?){
        lottieView?.play(fromFrame: 25, toFrame: 0, loopMode: loopMode == true ? .loop : .playOnce, completion: completion)
    }
    
    @objc func stop(){
        lottieView?.stop()
    }
    
    @objc func change(image name: String){
        lottieView?.animation = Animation.named(name)
    }
}

extension OBAnimateButton {
    @objc func playSuccess(){
        change(image: "refresh_success")
        play(loopMode: false) {[weak self] finish in
            if finish {
                self?.change(image: "refresh")
//                self?.stop()
            }
        }
    }
}
