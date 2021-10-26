//
//  LoadingGradientView.swift
//  
//
//  Created by user on 26.10.2021.
//

import UIKit

@available(iOS 13.0, *)
final public class LoadingGradientView: CAGradientLayer {
    
    init(bounds: CGRect) {
        super.init()
        colors = [UIColor.clear.cgColor, UIColor.systemGray.withAlphaComponent(0.1).cgColor, UIColor.clear.cgColor]
        startPoint = CGPoint(x: 0.0, y: 0.5)
        endPoint = CGPoint(x: 1.0, y: 0.525)
        locations = [0.4, 0.5, 0.6]
        frame = CGRect(x: -bounds.width, y: 0, width: bounds.width * 3, height: bounds.height)
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.repeatCount = .infinity
        animation.duration = 1.1
        animation.isRemovedOnCompletion = false

        add(animation, forKey: "shimmer")
    }
    
    required init?(coder: NSCoder) { nil }
    
}
