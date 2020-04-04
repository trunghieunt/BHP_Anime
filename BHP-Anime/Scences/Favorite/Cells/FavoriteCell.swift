//
//  FavoriteCell.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/8/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit

class FavoriteCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    var remove : () ->() = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 10
        addShadow(offset: CGSize.init(width: 0, height: 0), color: AppColors.shadowColor , radius: 14, opacity: 1)
        // Initialization code
    }
    
    func configCell(item: ObFavorite) {
        
        if let strUrl = item.posterPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500/" + strUrl)
self.img.kf.setImage(with: url)
        }else{
            self.img.image = UIImage(named: "test")
        }
        
    }
    
    @IBAction func actionRemove(_ sender: Any) {
        self.remove()
    }
    

}
