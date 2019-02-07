//
//  ViewModel.swift
//  NewsFeed
//
//  Created by Arnaldo on 05/02/2019.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import Foundation

class NewsViewModel {
    private let service: NewsServiceProtocol
    
    init(service: NewsServiceProtocol) {
        self.service = service
    }
        
    func loadNews(_ completion: @escaping NewsCompletion) {
        service.fetchNews(completion)
    }
    
}
