//
//  MainCoordinator.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/7/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinators {
    var navigationController: UINavigationController
    
    func start() {
        let vc = TabBarController.instantiate()
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension MainCoordinator: UITabBarControllerDelegate {}
extension MainCoordinator: NewsViewControllerDelegate {
    func didSelect(news: News) {
        self.navigationController.pushViewController(NewsDetailViewController.instantiate(), animated: true)
    }
}
