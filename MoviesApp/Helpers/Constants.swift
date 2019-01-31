//
//  Constants.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 30/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

struct Identifiers {
    ///Collection View Cell Identifiers
    struct CollectionCell {
        static let moviesGrid = "MoviesGridCell"
        static let moviesList = "MoviesListCell"
    }
    ///Table View Cell Identifiers
    struct TableCell {
        static let movieDetail = "MovieDetailTableCell"
    }
    ///Segue Identifiers
    struct Segue {
        static let movieDetail = "segueMovieDetail"
    }
    
}

struct APIConstant {
    static let baseLiveURL = "https://s3.eu-west-2.amazonaws.com/"
}

enum APIEndPoints: String {
    case movies = "ios-movies/list.json"
    
    func getURLString() -> String {
        return APIConstant.baseLiveURL + self.rawValue
    }
}


