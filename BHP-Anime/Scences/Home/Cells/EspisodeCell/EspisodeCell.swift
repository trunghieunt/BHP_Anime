//
//  EspisodeCell.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 4/3/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit
import Kingfisher

class EspisodeCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 15.0
        contentView.layer.masksToBounds = true
        
        /*
        img.layer.shadowColor = UIColor.lightGray.cgColor
        img.layer.shadowOffset = CGSize(width: 10, height: 10)
        img.layer.shadowRadius = 20
        img.layer.shadowOpacity = 0.2
        img.layer.masksToBounds = true
        img.layer.shadowPath = UIBezierPath(roundedRect: img.layer.bounds, cornerRadius: img.layer.cornerRadius).cgPath
 */
        
    }
    
    func configImage(_ thumb:String?){
                
        if let strUrl = thumb {
            let url = URL(string: "https://image.tmdb.org/t/p/w500/" + strUrl)
            img.kf.indicatorType = .activity
            img.kf.setImage(with: url)
        }
        
    }

}
