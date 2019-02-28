//
//  HeaderView.swift
//  Stretchyheader
//
//  Created by ahmad shiddiq on 21/02/19.
//  Copyright © 2019 ahmad shiddiq. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    let image_profil: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "sh")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.darkGray
        
        self.addSubview(image_profil)
        image_profil.fillSuperview()
        
        setupVisualEffectBlur()
    
    }
    
    var animator: UIViewPropertyAnimator!
    
    fileprivate func setupVisualEffectBlur(){
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
        
        animator.fractionComplete = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

