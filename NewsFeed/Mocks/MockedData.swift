//
//  MockedData.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/6/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import Foundation

class MockedData {
    static let fakeTitles = ["12 billion gallons of water pour into Lake Tahoe amid this week's hear wave",
                      "Waiting on Lionel Messi until the final moment ahead of the Clasico",
                      "The three decisions to make in Ernesto Valverde's Clasico XI",
                      "Josep Bartomeu on COPE: Neither Neymar or his father have called me",
                      "Kluivert: Kylian Mbappe is the best goalscorer in the world right now"]
    
    static let fakeProviders = ["Times", "Sport.es", "Marca", "Sun", "Ole"]
    
    static let fakeImages = ["news1", "news2", "news3", "news4", "news5"]

    static var news: News {
        get {
            let index = Int.random(in: 0 ... 4)
            return News(image: fakeImages[index], provider: fakeProviders[index], title: fakeTitles[index])
        }
    }
    
}

