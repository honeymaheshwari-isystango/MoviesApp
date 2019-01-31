//
//  MovieDetailTableCell.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

class MovieDetailTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(movieDetail: MovieDetailModel) {
        titleLabel.text = movieDetail.title
        descriptionLabel.text = movieDetail.description
    }

}
