//
//  SoundTrackCell.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 4/1/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit
import Kingfisher

class SoundTrackCell: UITableViewCell {

    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 6
    }
    
    func configCell(soundtrack: Soundtrack) {
        
        self.lblName.text = soundtrack.collectionName
        self.lblArtist.text = soundtrack.artistName
        
        
        let url = URL(string: soundtrack.artworkUrl100 ?? "")

        self.img.kf.setImage(with: url)
         
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
