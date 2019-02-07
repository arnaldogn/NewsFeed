//
//  CoverStoryDetail.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/7/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import UIKit

class CoverStoryDetail: UICollectionViewCell , UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let CoverStoryHorizontalCellID = "CoverStoryHorizontalCellID"
    
    lazy var coverStoryCollectionView: UICollectionView = {
        let flowLayout     = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing  = 15
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
        coverStoryCollectionView.register(CoverStoryHorizontalCell.self, forCellWithReuseIdentifier: CoverStoryHorizontalCellID)
        coverStoryCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CoverStoryDetail {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let coverStoriesCell: CoverStoryHorizontalCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.CoverStoryHorizontalCellID, for: indexPath) as? CoverStoryHorizontalCell, let news = news
        else { return UICollectionViewCell() }
        coverStoriesCell.configure(news[indexPath.row])
        return coverStoriesCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40.0, height: CGFloat(coverStoryDetailCellHeight))
    }
}
