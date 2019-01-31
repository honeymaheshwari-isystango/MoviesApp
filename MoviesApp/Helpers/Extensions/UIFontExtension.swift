//
//  UIFontExtension.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    class func appFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Medium", size: fontSize)!
    }
    
}
