//
//  CoverStory.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/7/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import UIKit

class CoverStory: UICollectionViewCell , UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let coverStoryCellID = "coverStoryCellID"
    let interitemSpacing: CGFloat = 15
    
    lazy var coverStoryCollectionView: UICollectionView = {
        let flowLayout     = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing  = self.interitemSpacing
        flowLayout.minimumLineSpacing       = 25
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        collectionView.alwaysBounceVertical = false
        collectionView.alwaysBounceHorizontal = false
        collectionView.allowsSelection = true
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var news: [News]? {
        didSet {
            coverStoryCollectionView.delegate = self
            coverStoryCollectionView.dataSource = self
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureCollectionView()
    }
    
    private func configureCollectionView() {
        
        addSubview(coverStoryCollectionView)
        
        coverStoryCollectionView.register(CoverStoryDetailCell.self, forCellWithReuseIdentifier: coverStoryCellID)
        coverStoryCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CoverStory {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCoverStories
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let coverStoriesCell: CoverStoryDetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.coverStoryCellID, for: indexPath) as? CoverStoryDetailCell, let news = news else { return UICollectionViewCell() } 
        coverStoriesCell.configure(news[indexPath.row])
        return coverStoriesCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/CGFloat(numberOfCoverStories) - (CGFloat(numberOfCoverStories) * self.interitemSpacing)  , height: coverStoryCellHeight)
    }
}
