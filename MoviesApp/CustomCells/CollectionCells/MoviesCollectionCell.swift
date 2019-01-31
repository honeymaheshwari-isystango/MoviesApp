//
//  MoviesCollectionCell.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 30/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    func populateData(_ movie: MovieModel) {
        let posterPlaceHolderImage = movie.title.createImageWith(frame: thumbnailImageView.frame)
        thumbnailImageView.sd_setImage(with: URL(string: movie.posterUrl), placeholderImage: posterPlaceHolderImage, options: [], completed: nil)
        if movieTitleLabel != nil {
            movieTitleLabel.text = movie.title
        }
        if genreLabel != nil {
            genreLabel.text = movie.genre
        }
        if yearLabel != nil {
            yearLabel.text = "\(movie.year)"
        }
    }
    
}
