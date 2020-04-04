//
//  GalleryCell.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 4/1/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        img.clipsToBounds = true
        self.layer.cornerRadius = 6
        // Initialization code
    }

}
