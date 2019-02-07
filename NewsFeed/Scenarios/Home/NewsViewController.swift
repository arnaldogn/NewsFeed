//
//  NewsViewController.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/7/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import  UIKit

let coverStoryCellHeight: CGFloat = 285.0
let coverStoryDetailCellHeight  = 120
let trendingStoryDetailCellHeight  = 100
let numberOfCoverStories = 2
let numberOfCoverDetailStories = 4

protocol NewsViewControllerDelegate: class {
    func didSelect(news: News)
}

class NewsViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let mainTopStoryCellID = "mainTopStoryCellID"
    let coverStoryCellID = "coverStoryCellID"
    let coverStoryDetailID = "storyDetailID"
    let NewsSectionHeaderViewID = "NewsSectionHeaderViewID"
    let NewsSectionFooterViewID = "NewsSectionFooterViewID"
    
    lazy var newsCollectionView: UICollectionView = {
        let flowLayout     = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing  = 15
        flowLayout.minimumLineSpacing       = 20
        flowLayout.scrollDirection = .vertical
        flowLayout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 70)
        flowLayout.footerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0.0, bottom: 25.0, right: 0.0)
        collectionView.alwaysBounceVertical = true
        collectionView.alwaysBounceHorizontal = false
        collectionView.allowsSelection = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    var news = [News]()
    let viewModel = NewsViewModel(service: NewsService())
    var detailStoriesCount = 0
    weak var delegate: NewsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        view.backgroundColor = UIColor.white
        self.configureCollectionView()
        viewModel.loadNews { (response, error) in
            guard let response = response else { return }
            self.news = response
            self.newsCollectionView.delegate = self
            self.newsCollectionView.dataSource = self
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func configureCollectionView() {
        view.addSubview(newsCollectionView)
        newsCollectionView.register(MainTopStoryCell.self, forCellWithReuseIdentifier: mainTopStoryCellID)
        newsCollectionView.register(CoverStory.self, forCellWithReuseIdentifier: coverStoryCellID)
        newsCollectionView.register(CoverStoryDetail.self, forCellWithReuseIdentifier: coverStoryDetailID)
        newsCollectionView.register(NewsSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NewsSectionHeaderViewID)
        newsCollectionView.register(NewsSectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NewsSectionFooterViewID)
        newsCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension NewsViewController {
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView : NewsSectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                                     withReuseIdentifier: NewsSectionHeaderViewID,
                                                                                                     for: indexPath) as! NewsSectionHeaderView
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            
            let headerView : NewsSectionFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                                     withReuseIdentifier: NewsSectionFooterViewID,
                                                                                                     for: indexPath) as! NewsSectionFooterView
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3//Kind of stories
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < news.count {
            delegate?.didSelect(news: news[indexPath.row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            guard let topStoryCell : MainTopStoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.mainTopStoryCellID, for: indexPath) as? MainTopStoryCell, let news = news.first else { return UICollectionViewCell() }
            topStoryCell.configure(news)
            return topStoryCell
        case 1:
            guard let coverStoryCell: CoverStory = collectionView.dequeueReusableCell(withReuseIdentifier: self.coverStoryCellID, for: indexPath) as? CoverStory, news.count > 2 else { return UICollectionViewCell() }
            let coverNews = news[1...numberOfCoverStories]
            coverStoryCell.news = Array(coverNews)
            return coverStoryCell
        default:
            guard let coverStoryCell: CoverStoryDetail = collectionView.dequeueReusableCell(withReuseIdentifier: self.coverStoryDetailID, for: indexPath) as? CoverStoryDetail, news.count > 3 else { return UICollectionViewCell() }
            let coverNews = news[numberOfCoverStories...]
            coverStoryCell.news = Array(coverNews)
            return coverStoryCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width - 40.0, height: CGFloat(480))
        case 1:
            return CGSize(width: UIScreen.main.bounds.width - 40.0, height: CGFloat(coverStoryCellHeight))
        default:
            return CGSize(width: UIScreen.main.bounds.width - 40.0, height: CGFloat((coverStoryDetailCellHeight + 20) * numberOfCoverDetailStories))
        }
    }
}

