//
//  UIColorExtnsion.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    open class var appDarkTextColor: UIColor {
        get {
            return UIColor(named: "appDarkTextColor")!
        }
    }
    
    open class var appLightTextColor: UIColor {
        get {
            return UIColor(named: "appLightTextColor")!
        }
    }
    
    open class var appLightTheme: UIColor {
        get {
            return UIColor(named: "appLightTheme")!
        }
    }
    
    open class var appTheme: UIColor {
        get {
            return UIColor(named: "appTheme")!
        }
    }
    
}
