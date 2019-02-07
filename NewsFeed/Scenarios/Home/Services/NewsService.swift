//
//  NewsService.swift
//  NewsFeed
//
//  Created by Arnaldo on 05/02/2019.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import Foundation

let fakeNewsArray = Array(repeatElement(MockedData.news, count: 11))

protocol NewsServiceProtocol {
    func fetchNews(from url: String, _ completion: @escaping NewsCompletion)
}

extension NewsServiceProtocol {
    func fetchNews(_ completion: @escaping NewsCompletion) {
        return fetchNews(from: "", completion)
    }
}

typealias NewsCompletion = ([News]?, CustomError?) -> ()

class NewsService: NewsServiceProtocol {
    internal func fetchNews(from url: String, _ completion: @escaping NewsCompletion) {
        var arr = [News]()
        for _ in 0..<11 {
            arr.append(MockedData.news)
        }
        completion(arr, nil)
    }
}
