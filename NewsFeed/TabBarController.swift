//
//  TabBarController.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/7/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, Storyboarded {
    override func viewDidLoad() {
        setupControllers()
    }
    
    private func setupControllers() {
        title = "NewsFeed"
        guard let vcArr = viewControllers, let navigation = vcArr.first as? UINavigationController, let vc = navigation.viewControllers.first else { return }
        switch vc {
        case is NewsViewController :
            let newsVC = vc as? NewsViewController
            if let newsDelegate = self.delegate as? NewsViewControllerDelegate {
                newsVC?.delegate = newsDelegate
            }
        default:
            break
        }
        
    }
}
