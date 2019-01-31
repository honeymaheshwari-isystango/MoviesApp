//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit
import SDWebImage
import youtube_ios_player_helper

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var movieDetailTableView: UITableView!
    @IBOutlet weak var ytVideoPlayerView: YTPlayerView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicatorBackgroundView: UIVisualEffectView!
    @IBOutlet weak var playVideoButton: UIButton!
    
    var movieDetailViewModel = MovieDetailViewModel()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
            self.updateUIComponents()
        }
    }
    // MARK: - Public methods

    func updateSelectedMovieModel(_ movie: MovieModel) {
        movieDetailViewModel.selectedMovie = movie
    }
    
    // MARK: - Private methods
    
    private func updateUIComponents() {
        self.backgroundImageView.makeBlurImage()
        if let selectedMovie = movieDetailViewModel.selectedMovie {
            let posterPlaceHolderImage = selectedMovie.title.createImageWith(frame: thumbnailImageView.frame)
            thumbnailImageView.sd_setImage(with: URL(string: selectedMovie.posterUrl), placeholderImage: posterPlaceHolderImage, options: [], completed: nil)
            backgroundImageView.sd_setImage(with: URL(string: selectedMovie.posterUrl), placeholderImage: posterPlaceHolderImage, options: [], completed: nil)
            title = selectedMovie.title
        }
        self.movieDetailTableView.reloadData()
        if movieDetailViewModel.videoId.count > 0 {
            ytVideoPlayerView.load(withVideoId: movieDetailViewModel.videoId)
            ytVideoPlayerView.delegate = self
            self.playVideoButton.isHidden = false
        } else {
            movieDetailTableView.tableFooterView = nil
            self.playVideoButton.isHidden = true
        }
    }
    
    // MARK: - Button Action
    
    @IBAction private func playVideoButtonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            let bottom = CGPoint(x: 0, y: self.movieDetailTableView.contentSize.height - self.movieDetailTableView.frame.height)
            self.movieDetailTableView.setContentOffset(bottom, animated: true)
            self.ytVideoPlayerView.playVideo()
        }
    }
    
}

extension MovieDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDetailViewModel.movieDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TableCell.movieDetail) as! MovieDetailTableCell
        cell.populateData(movieDetail: movieDetailViewModel.movieDetails[indexPath.row])
        return cell
    }
    
}

extension MovieDetailViewController: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        DispatchQueue.main.async {
            self.activityIndicatorBackgroundView.isHidden = true
            self.activityIndicatorView.stopAnimating()
        }
    }
}
