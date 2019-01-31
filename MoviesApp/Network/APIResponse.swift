//
//  APIResponse.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

struct APIResponse {
    var body: [String: Any]
    var header: [String: Any]
    var statusCode: Int
    var errorMessage: String
}
