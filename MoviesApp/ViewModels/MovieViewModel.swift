//
//  MovieViewModel.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

class MovieViewModel: NSObject, APIManager {

    var movies = [MovieModel]()
    
    ///Get movies list from api
    func getMoviesFromServer(completionHandler: @escaping () -> Void) {
        performGetOperation(endPoint: .movies) { (apiResponse) in
            if apiResponse.body.count > 0, let arrData = apiResponse.body["data"] as? [[String: Any]] {
                self.movies.removeAll()
                self.movies = arrData.map({ MovieModel($0) })
            }
            completionHandler()
        }
    }
    
}
