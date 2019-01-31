//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

class MovieDetailViewModel: NSObject {

    enum MovieSpecification: Int, CaseIterable {
        case title = 0
        case summary
        case cast
        case director
        case year
        case genre
        
        func text() -> String {
            return "\(self)".localized()
        }
    }
    
    var movieDetails = [MovieDetailModel]()
    var updateUIBlock: (() -> Void)?
    var selectedMovie: MovieModel! {
        didSet {
            prepareDisplayArray()
        }
    }
    ///youtube video id
    var videoId: String {
        get {
            return selectedMovie.trailerUrl.youtubeID ?? ""
        }
    }
    
    func prepareDisplayArray() {
        movieDetails.removeAll()
        for i in MovieSpecification.allCases {
            var detail: MovieDetailModel!
            switch i {
            case .title:
                detail = MovieDetailModel(title: i.text(), description: selectedMovie.title)
            case .summary:
                detail = MovieDetailModel(title: i.text(), description: selectedMovie.summary)
            case .cast:
                detail = MovieDetailModel(title: i.text(), description: selectedMovie.cast)
            case .director:
                detail = MovieDetailModel(title: i.text(), description: selectedMovie.director)
            case .year:
                detail = MovieDetailModel(title: i.text(), description: "\(selectedMovie.year)")
            case .genre:
                detail = MovieDetailModel(title: i.text(), description: selectedMovie.genre)
            }
            movieDetails.append(detail)
        }
        if let block = updateUIBlock {
            block()
        }
    }
    
    
}
