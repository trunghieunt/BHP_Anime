//
//  EspisodeVC.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 4/2/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit


class EspisodeVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieGenreRuntimeReleaseDate: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    
    var id: String!
    var season: String!
    
    fileprivate var cardSize: CGSize {
        let layout = collectionView.collectionViewLayout as! ScrollCardCollectionViewLayout
        var cardSize = layout.itemSize
        cardSize.width =  cardSize.width + layout.minimumLineSpacing
        return cardSize
    }
    
    fileprivate var currentPage: Int = 0 {
        didSet {
            self.changeMovieDetailsUnderneath()
        }
    }
    
    var listEpisode : [EpisodeItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Espisode"
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.clipsToBounds = false
        collectionView.registerCell(EspisodeCell.className)
        
        getEpisodeItems()
        

        // Do any additional setup after loading the view.
    }
    
    func getEpisodeItems() {
        
        self.showLoadingIndicator()
        AnimeAPIManager.sharedInstance.getEpisodeItems(id: id, seasons: season, success: { [weak self] (listEpisode) in
            
            guard let strongSelf = self else {return}
            strongSelf.listEpisode = listEpisode
            strongSelf.collectionView.reloadData()
            strongSelf.hideLoadingIndicator()
            strongSelf.changeMovieDetailsUnderneath()
            
        }) { (error) in
            print(error)
        }
    }
   
    func changeMovieDetailsUnderneath() {
        
        self.movieName.text = self.listEpisode[self.currentPage].name
        self.movieGenreRuntimeReleaseDate.text = self.listEpisode[self.currentPage].airDate
        self.movieRating.text = String(self.listEpisode[self.currentPage].voteAverage ?? 0)
        self.movieDescription.text = self.listEpisode[self.currentPage].overview
        
    }

}

extension EspisodeVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listEpisode.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EspisodeCell.className, for: indexPath) as! EspisodeCell
        cell.configImage(listEpisode[indexPath.row].stillPath)
        
        return cell
    }
    
}
extension EspisodeVC:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let carSide =  self.cardSize.width
        let offset =  scrollView.contentOffset.x
        currentPage = Int(floor((offset - carSide / 2) / carSide) + 1)
    }
}
