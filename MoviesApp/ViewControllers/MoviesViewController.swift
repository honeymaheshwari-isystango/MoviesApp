//
//  MoviesViewController.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 30/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var toggelLayoutButton: UIBarButtonItem!
    
    let listFlowLayout = CollectionViewListFlowLayout()
    let gridFlowLayout = CollectionViewGridFlowLayout()
    
    var isListFlow: Bool = false {
        didSet {
            toggelViewLayout()
        }
    }
    let movieViewModel = MovieViewModel()

    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        updateCollectionView()
        getMoviesList()
    }
    
    // MARK: - Private methods
    
    fileprivate func getMoviesList() {
        movieViewModel.getMoviesFromServer {
            DispatchQueue.main.async {
                self.moviesCollectionView.reloadData()
                self.movieViewModel.movies.count == 0 ? self.moviesCollectionView.displayBackgroundText(text: "noMovieMata".localized()) : self.moviesCollectionView.removeBackgroundText()
            }
        }
    }
    
    private func toggelViewLayout() {
        self.toggelLayoutButton.image = self.isListFlow ? #imageLiteral(resourceName: "gridView") : #imageLiteral(resourceName: "listView")
        updateCollectionView(true)
    }
    
    private func updateCollectionView(_ animate: Bool = false) {
        DispatchQueue.main.async {
            self.moviesCollectionView.reloadData()
            self.moviesCollectionView.performBatchUpdates(nil, completion: { (_) in
                self.moviesCollectionView.collectionViewLayout.invalidateLayout()
                self.moviesCollectionView.setCollectionViewLayout(self.isListFlow ? self.listFlowLayout : self.gridFlowLayout, animated: animate)
            })
        }
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MovieDetailViewController, let indexPath = sender as? IndexPath {
            destination.updateSelectedMovieModel(movieViewModel.movies[indexPath.row])
        }
    }
    
    // MARK: - Button Action
    
    @IBAction private func changeLayoutButtonTapped(_ sender: Any) {
        isListFlow.toggle()
    }

}

extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieViewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: isListFlow ? Identifiers.CollectionCell.moviesList : Identifiers.CollectionCell.moviesGrid, for: indexPath) as! MoviesCollectionCell
        cell.populateData(movieViewModel.movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: Identifiers.Segue.movieDetail, sender: indexPath)
    }
    
}
