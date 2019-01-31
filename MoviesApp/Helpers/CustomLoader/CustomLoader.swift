//
//  CustomLoader.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

class CustomLoader: NSObject {

    static let shared = CustomLoader()
    
    fileprivate lazy var activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
    
    func showHUD() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            if let visibleWindow = UIWindow.visibleWindow() {
                self.activityIndicatorView.center = visibleWindow.center
                visibleWindow.addSubview(self.activityIndicatorView)
                self.activityIndicatorView.startAnimating()
            }
        }
    }
    
    func hideHUD() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.removeFromSuperview()
        }
    }
    
}


internal extension UIWindow {
    static func visibleWindow() -> UIWindow? {
        var currentWindow = UIApplication.shared.keyWindow
        if currentWindow == nil {
            let frontToBackWindows = Array(UIApplication.shared.windows.reversed())
            for window in frontToBackWindows {
                if window.windowLevel == UIWindow.Level.normal {
                    currentWindow = window
                    break
                }
            }
        }
        return currentWindow
    }
}
