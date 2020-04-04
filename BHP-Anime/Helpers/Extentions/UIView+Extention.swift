//
//  UIView+Extention.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/6/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(offset: CGSize = CGSize(width: 2, height: 2), color: UIColor = UIColor.black, radius: CGFloat = 4, opacity: Float = 0.25) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
