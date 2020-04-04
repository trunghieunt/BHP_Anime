//
//  ItemsCell.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/5/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit




class ItemsCell: UICollectionViewCell{

    @IBOutlet weak var imgAdd: UIImageView!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 16
        imgAdd.isHidden = true
    }
    func configCell(_ item: Popular){
        StorageFavorite.sharedInstance.loadFavorites(success: { (listFavorite) in
            let listFavorites = listFavorite
            let results = listFavorites.filter { $0.id == String(item.id ?? 0)}
            if results.isEmpty == false{
                self.imgAdd.image = UIImage(named: "ic_check")
            }else{
                self.imgAdd.image = UIImage(named: "ic_plus")
            }
        }) {
            self.imgAdd.image = UIImage(named: "ic_plus")
        }
        
        if let strUrl = item.posterPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500/" + strUrl)
            self.img.kf.setImage(with: url)
        }else{
            self.img.image = UIImage(named: "test")
        }

    }

    
}
