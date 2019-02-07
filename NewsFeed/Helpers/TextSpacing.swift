//
//  TextSpacing.swift
//  NewsFeed
//
//  Created by Arnaldo on 2/7/19.
//  Copyright © 2019 Arnaldo. All rights reserved.
//

import UIKit

public func textSpacing(_ labelSelected : UILabel, spacing: CGFloat) {
    
    let attributedString = labelSelected.attributedText as? NSMutableAttributedString
    attributedString?.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, (attributedString?.length)!))
    
}
