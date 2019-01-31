//
//  MovieModel.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

struct MovieModel {
    
    var id: String
    var title: String
    var posterUrl: String
    var summary: String
    var cast: String
    var director: String
    var year: Int
    var trailerUrl: String
    var genre: String
    
}

extension MovieModel {
    
    init(_ dict: [String: Any]) {
        id = dict.getString(forKey: "id")
        title = dict.getString(forKey: "title")
        posterUrl = dict.getString(forKey: "poster")
        summary = dict.getString(forKey: "summary")
        cast = dict.getString(forKey: "cast")
        director = dict.getString(forKey: "director")
        year = dict.getInt(forKey: "year")
        trailerUrl = dict.getString(forKey: "trailer")
        genre = dict.getString(forKey: "genre")
    }
    
}
