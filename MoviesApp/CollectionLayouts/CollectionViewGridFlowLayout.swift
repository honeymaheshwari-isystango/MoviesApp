//
//  CollectionViewGridFlowLayout.swift
//  MoviesApp
//
//  Created by Honey Maheshwari on 31/01/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

class CollectionViewGridFlowLayout: UICollectionViewFlowLayout {
        
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
    
    func itemWidth() -> CGFloat {
        return ((collectionView!.frame.size.width)/2)-1
    }
    
    override var itemSize: CGSize {
        set {
            let width = itemWidth()
            self.itemSize = CGSize(width: width, height: width + 20)
        } get {
            let width = itemWidth()
            return CGSize(width: width, height: width + 20)
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
    
}
