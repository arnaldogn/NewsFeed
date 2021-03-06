//
//  Storyboarded.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/7/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate(from storyboard: Storyboard) -> Self
}

extension Storyboarded {
    static func instantiate(from storyboard: Storyboard = .Main) -> Self {
        return instantiate(from: storyboard)
    }
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(from storyboard: Storyboard) -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        return storyboard.instance.instantiateViewController(withIdentifier: className) as! Self
    }
}
