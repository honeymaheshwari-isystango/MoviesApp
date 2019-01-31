//
//  CollectionViewListFlowLayout.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

class CollectionViewListFlowLayout: UICollectionViewFlowLayout {
    
    let itemHeight: CGFloat = 200
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
    
    func itemWidth() -> CGFloat {
        return collectionView!.frame.size.width
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth(), height: itemHeight)
        } get {
            return CGSize(width: itemWidth(), height: itemHeight)
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
    
}
