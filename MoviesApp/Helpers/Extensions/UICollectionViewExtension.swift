//
//  UICollectionViewExtension.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    ///To display the text in collection view background
    ///
    /// Parameters:
    ///     - text: text to display
    ///     - font: text font
    func displayBackgroundText(text: String, font: UIFont = UIFont.appFont(ofSize: 16.0)) {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 10, y: 0, width: self.bounds.size.width - 20, height: self.bounds.size.height)
        lbl.text = text
        lbl.textColor = .appLightTextColor
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = font
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        backgroundView.addSubview(lbl)
        self.backgroundView = backgroundView
    }
    ///To remove the text added in collection view background
    func removeBackgroundText() {
        self.backgroundView = nil
    }
    
}
