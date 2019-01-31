//
//  NetworkConstants.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

typealias APIResponseBlock = (APIResponse) -> Void

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct ErrorMessage {
    static let kInvalidURL = "Invalid URL"
    static let kInvalidHeaderValue = "Header value is not string"
    static let kNoData = "No Data available"
    static let kConversionFailed = "Conversion Failed"
    static let kInvalidJSON = "Invalid JSON"
    static let kInvalidResponse = "Invalid Response"
}
