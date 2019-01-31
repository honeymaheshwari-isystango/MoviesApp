//
//  DataExtension.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

extension Data {
    
    /// Converts Data into Dictionary[String: Any]
    ///
    /// - Returns: Dictionary
    func convertToDictionary() -> [String: Any] {
        do {
            return try JSONSerialization.jsonObject(with: self, options: []) as? [String: Any] ?? [:]
        } catch {
            print(error.localizedDescription)
        }
        return [:]
    }
}
