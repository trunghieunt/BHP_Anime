//
//  HomeVC.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/4/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit
import PullToRefreshKit
import StoreKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
   
    private var isShowRate = false
    private var page = 1
    private var type = 1
    private var isLoading = false
    
    var listItem : [Popular] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
        
        if listItem.count == 0 {
            getlistItems(false, type: type)
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if !isShowRate{
            showAskRateApp()
        }
        
    }
    

    func configUI() {
        title = "Anime"

        self.tableview.registerCell(ScaledCell.className)
        self.tableview.registerCell(SearchCell.className)
        self.tableview.registerCell(MenuCell.className)
        self.tableview.dataSource = self
        self.tableview.separatorStyle = .none
        self.tableview.delegate = self
        
        
        self.tableview.configRefreshFooter(container: self) {
            self.getlistItems(true, type: self.type)
        }
        
//        self.tableview.configRefreshHeader(container: self) {
//            self.getlistItems(false, type: self.type)
//            self.tableview.switchRefreshHeader(to: .normal(.success, 0.5))
//        }
        let header = DefaultRefreshHeader.header()
        header.setText("", mode: .pullToRefresh)
        self.tableview.configRefreshHeader(with: header, container: self) {
             self.getlistItems(false, type: self.type)
        }
    }
    
    
    func showAskRateApp(){
        
        #if !targetEnvironment(simulator)
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            }
        #endif
        
    }
    
    func getlistItems(_ loadmore: Bool, type: Int) {
        if loadmore{
            self.page += 1
        }else{
            self.page = 1
            self.showLoadingIndicator()
        }
        
        AnimeAPIManager.sharedInstance.listPopular(type: type, page: String(self.page), success: { (listItems) in
            
            if loadmore{
                self.listItem.append(contentsOf: listItems)
            }else{
                self.listItem = listItems
            }
            
            self.hideLoadingIndicator()
            self.tableview.reloadData()
            self.tableview.switchRefreshFooter(to: .normal)
            self.tableview.switchRefreshHeader(to: .normal(.success, 0.5))
        }) { (error) in
            print(error)
            self.showToastAtBottom(message: error)
            self.hideLoadingIndicator()
            self.tableview.switchRefreshFooter(to: .normal)
            self.tableview.switchRefreshHeader(to: .normal(.success, 0.5))
        }
    }
    

}

extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listItem.count > 4{
            return listItem.count - 4
        }else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let scaledCell = tableView.dequeueReusableCell(withIdentifier: ScaledCell.className, for: indexPath) as! ScaledCell
            
            scaledCell.selectionStyle = UITableViewCell.SelectionStyle.none
            let listItemsScaled = self.listItem[0..<5]
            scaledCell.listItems = Array(listItemsScaled)
            scaledCell.collectionView.reloadData()
            return scaledCell
        }else if indexPath.row == 1{
            let menuCell = tableView.dequeueReusableCell(withIdentifier: MenuCell.className, for: indexPath) as! MenuCell
            menuCell.selectionStyle = UITableViewCell.SelectionStyle.none

            menuCell.doneAction = {[weak self](type) in
                self?.type = type
                self?.getlistItems(false, type: type)
            }
            return menuCell
        } else{
            let simpleCell = tableView.dequeueReusableCell(withIdentifier: SearchCell.className, for: indexPath) as! SearchCell

            simpleCell.selectionStyle = UITableViewCell.SelectionStyle.none

            simpleCell.configCell(listItem[indexPath.row + 3 ])
            return simpleCell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 240
        }else if indexPath.row == 1{
            return 40
        }else{
            return 127
        }
        
    }
    
}


extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailAnimeVC = DetailAnimeVC.loadFromNib()

        detailAnimeVC.id = String(listItem[indexPath.row + 3].id ?? 0)

        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailAnimeVC, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
}
