//
//  UIImageViewExtension.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    ///To add blur effect in image view
    ///
    /// Parameters:
    ///     - effect: UIBlurEffect.Style blur style
    func makeBlurImage(_ effect: UIBlurEffect.Style = .dark) {
        let blurEffect = UIBlurEffect(style: effect)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}
