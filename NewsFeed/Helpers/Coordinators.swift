//
//  Coordinators.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/7/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import UIKit

protocol Coordinators {
    var navigationController: UINavigationController { get set }
    func start()
}
