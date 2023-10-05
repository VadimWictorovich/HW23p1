//
//  ExtentionUIButton.swift
//  HW23p1
//
//  Created by Вадим Игнатенко on 4.10.23.
//

import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 1
        pulse.fromValue = 0.9
        pulse.toValue = 1.1
        pulse.autoreverses = true
        pulse.initialVelocity = 0.9
        pulse.damping = 1
        layer.add(pulse, forKey: nil)
    }
    
}
