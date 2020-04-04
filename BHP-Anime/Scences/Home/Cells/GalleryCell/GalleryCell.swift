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
        self.img.layer.cornerRadius = 6
    }
    
    func configImage(_ thumb:String?){
        
        if let strUrl = thumb {
            let url = URL(string: "https://image.tmdb.org/t/p/w500/" + strUrl)
            img.kf.indicatorType = .activity
            img.kf.setImage(with: url)
        }
        
    }

}
