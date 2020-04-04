//
//  SoundTrackVC.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 4/1/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit
import EmptyDataSet_Swift


class SoundTrackVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var name : String?
    var listSoundtrack : [Soundtrack] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sound Track"
        tableView.registerCell("SoundTrackCell")
        self.tableView.emptyDataSetSource = self
        self.tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0)
        self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        
        self.showLoadingIndicator()
        AnimeAPIManager.sharedInstance.getSoundtrack(name: self.name ?? "", success: { [weak self] (listSoundtrack) in
            
            guard let sSelf = self else {return}
            print(listSoundtrack.count)
            sSelf.hideLoadingIndicator()
            sSelf.listSoundtrack = listSoundtrack
            sSelf.tableView.reloadData()
        }) { (error) in
            print(error)
        }
        
       
        // Do any additional setup after loading the view.
    }
    


    @IBAction func btnBack(_ sender: Any) {
        self.popViewController()
    }
}
extension SoundTrackVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSoundtrack.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SoundTrackCell.className, for: indexPath) as! SoundTrackCell
        cell.configCell(soundtrack: listSoundtrack[indexPath.row])
        return cell
    }
    
    
}

extension SoundTrackVC: EmptyDataSetSource {
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(named: "no_data")
    }
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let title = "No Data Sound Track"
        let titleColor = [ NSAttributedString.Key.foregroundColor: UIColor.init("#ACC4E3"), NSAttributedString.Key.font: AppFonts.coreSansGS45Regular(17)]
        let titleAttrString = NSAttributedString(string: title, attributes: titleColor)

        return titleAttrString
    }
}

extension SoundTrackVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: listSoundtrack[indexPath.row].collectionViewUrl ?? ""){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
