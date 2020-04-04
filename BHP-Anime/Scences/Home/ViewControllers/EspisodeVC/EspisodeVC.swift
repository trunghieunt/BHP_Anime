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
    
    var id: String?
    var season: String?
    
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
        getEpisodeItems()
        

        // Do any additional setup after loading the view.
    }
    
    func getEpisodeItems() {
        AnimeAPIManager.sharedInstance.getEpisodeItems(id: id ?? "60572", seasons: season ?? "1", success: { (listEpisode) in
            self.listEpisode = listEpisode
            self.configTB()
        }) { (error) in
            print(error)
        }
    }
    
    func configTB() {

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.clipsToBounds = false
        collectionView.registerCell(EspisodeCell.className)
        
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: IndexPath(row: 2, section: 0), at: .centeredHorizontally, animated: false)
            self.collectionView.alpha = 1
        }
    }
    
   
    func changeMovieDetailsUnderneath() {
        
//        UILabel.animate(withDuration: 0.8) {
            self.movieName.text = self.listEpisode[self.currentPage].name
//            self.movieGenreRuntimeReleaseDate.text = self.listEpisode[self.currentPage].genre! + " | " + self.listEpisode[self.currentPage].runtime! + " | " + self.listEpisode[self.currentPage].releaseDate!
            self.movieGenreRuntimeReleaseDate.text = self.listEpisode[self.currentPage].airDate
            self.movieRating.text = String(self.listEpisode[self.currentPage].voteAverage ?? 0)
            self.movieDescription.text = self.listEpisode[self.currentPage].overview
//        }
        
    }
    


}

extension EspisodeVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listEpisode.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EspisodeCell.className, for: indexPath) as! EspisodeCell
        
//        cell.img.image = listEpisode[indexPath.row].stillPath
        
        if let strUrl = listEpisode[indexPath.row].stillPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500/" + strUrl)

            cell.img.kf.setImage(with: url)
        }else{
            cell.img.image = UIImage(named: "test")
        }
        
        cell.contentView.layer.cornerRadius = 15.0
        cell.contentView.layer.masksToBounds = true
        
        cell.img.layer.shadowColor = UIColor.lightGray.cgColor
        cell.img.layer.shadowOffset = CGSize(width: 10, height: 10)
        cell.img.layer.shadowRadius = 20
        cell.img.layer.shadowOpacity = 0.2
        cell.img.layer.masksToBounds = false
        cell.img.layer.shadowPath = UIBezierPath(roundedRect: cell.img.layer.bounds, cornerRadius: cell.img.layer.cornerRadius).cgPath
        
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
