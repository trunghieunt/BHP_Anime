//
//  PlayerVideoVC.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/8/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit
import YouTubePlayer

class PlayerVideoVC: UIViewController {
    
@IBOutlet var videoPlayer: YouTubePlayerView!
    
    @IBOutlet weak var titleName: UILabel!
    var nameVideo: String?
    var key: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleName.text = nameVideo
//        self.navigationController?.navigationBar.isHidden = true

        videoPlayer.loadVideoID(key ?? "")
        videoPlayer.play()
        
//        playerVideo.loadVideo(videoID: key ?? "")
//        playerVideo.autoplay = true
//        
//        playerVideo.delegate = self
//        playerVideo.loadPlayer()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actiondismiss(_ sender: Any) {
        self.popViewController()
        
    }
    
    
}
