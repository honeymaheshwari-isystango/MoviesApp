//
//  APIManager.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

protocol APIManager: NetworkHttpClient {
    /// Perform GET Operations
    func performGetOperation(endPoint: APIEndPoints, parameters: [String: Any], headers: [String: String], showHUD: Bool, completionHandler: @escaping APIResponseBlock)
    /// Perform POST Operations
    func performPostOperation(endPoint: APIEndPoints, parameters: [String: Any], headers: [String: String], showHUD: Bool, completionHandler: @escaping APIResponseBlock)
    /// Perform PUT Operations
    func performPutOperation(endPoint: APIEndPoints, parameters: [String: Any], headers: [String: String], showHUD: Bool, completionHandler: @escaping APIResponseBlock)
    /// Perform DELETE Operations
    func performDeleteOperation(endPoint: APIEndPoints, parameters: [String: Any], headers: [String: String], showHUD: Bool, completionHandler: @escaping APIResponseBlock)
}


extension APIManager {
    
    func performGetOperation(endPoint: APIEndPoints, parameters: [String: Any] = [:], headers: [String: String] = [:], showHUD: Bool = true, completionHandler: @escaping APIResponseBlock) {
        if showHUD {
            CustomLoader.shared.showHUD()
        }
        callAPIWith(endPoint.getURLString(), httpMethod: .get, parameters: parameters, headers: headers) { (response) in
            if showHUD {
                CustomLoader.shared.hideHUD()
            }
            completionHandler(response)
        }
    }
    
    func performPostOperation(endPoint: APIEndPoints, parameters: [String: Any] = [:], headers: [String: String] = [:], showHUD: Bool = true, completionHandler: @escaping APIResponseBlock) {
        if showHUD {
            CustomLoader.shared.showHUD()
        }
        callAPIWith(endPoint.getURLString(), httpMethod: .post, parameters: parameters, headers: headers) { (response) in
            if showHUD {
                CustomLoader.shared.hideHUD()
            }
            completionHandler(response)
        }
    }
    
    func performPutOperation(endPoint: APIEndPoints, parameters: [String: Any] = [:], headers: [String: String] = [:], showHUD: Bool = true, completionHandler: @escaping APIResponseBlock) {
        if showHUD {
            CustomLoader.shared.showHUD()
        }
        callAPIWith(endPoint.getURLString(), httpMethod: .put, parameters: parameters, headers: headers) { (response) in
            if showHUD {
                CustomLoader.shared.hideHUD()
            }
            completionHandler(response)
        }
    }
    
    func performDeleteOperation(endPoint: APIEndPoints, parameters: [String: Any] = [:], headers: [String: String] = [:], showHUD: Bool = true, completionHandler: @escaping APIResponseBlock) {
        if showHUD {
            CustomLoader.shared.showHUD()
        }
        callAPIWith(endPoint.getURLString(), httpMethod: .delete, parameters: parameters, headers: headers) { (response) in
            if showHUD {
                CustomLoader.shared.hideHUD()
            }
            completionHandler(response)
        }
    }
    
}
