//
//  SimpleCell.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/5/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit
import Kingfisher

class SimpleCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleAnime: UILabel!
    
    @IBOutlet weak var lblEpisiode: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var viewImg: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 6
        viewImg.layer.cornerRadius = 6
        viewImg.addShadow()
    }

    func configCell(_ item : Popular)  {

        
        if let strUrl = item.backdropPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500/" + strUrl)

            self.img.kf.setImage(with: url)
        }else{
            self.img.image = UIImage(named: "test")
        }

        self.titleAnime.text = item.name
        self.time.text = item.firstAirDate
        self.lblEpisiode.text = "Vote: " +  String(item.voteAverage ?? 0)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
