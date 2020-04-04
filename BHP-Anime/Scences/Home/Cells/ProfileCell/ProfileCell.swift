//
//  ProfileCell.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 4/1/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 6
        // Initialization code
        img.kf.indicatorType = .activity
    }
    
    func setCellData(_ author: CreatedBy?){
        
        if let se = author{
            name.text = se.name
            configImage(se.profilePath, placeholder: "account")
        }
        
    }
    
    func setCellData(_ season: Seasons?){
        
        if let se = season{
            name.text = se.name
            configImage(se.posterPath, placeholder: "")
        }
        
    }
    
    private func configImage(_ thumb:String?, placeholder:String){
        
        if let strUrl = thumb {
            let url = URL(string: "https://image.tmdb.org/t/p/w500/" + strUrl)
            img.kf.setImage(with: url)
        } else if placeholder != "" {
            img.image = UIImage(named: placeholder)
        }
        
    }

}
