//
//  News.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/7/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import Foundation

protocol NewsCellProtocol {
    func configure(_ news: News)
}

struct News {
    let image: String
    let provider: String
    let title: String
}
