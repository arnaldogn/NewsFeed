//
//  SportsNewsViewController.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/8/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import WebKit

class SportsViewController: UIViewController  {
    let webView = WKWebView()
    let url = "https://www.sport-english.com/en/"
    override func viewDidLoad() {
        setupViews()
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    private func setupViews() {
        view.addSubview(webView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}


