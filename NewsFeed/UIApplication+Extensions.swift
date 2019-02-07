//
//  UIApplication+Extensions.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/8/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
