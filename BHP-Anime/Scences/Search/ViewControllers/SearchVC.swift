//
//  SearchVC.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/4/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit
import PullToRefreshKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchbar: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    var page = 1
    var listItem : [Popular] = []
    var textSearch : String = ""
    private var searchTimer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    func configUI(){
        searchbar.addRightImage("ic_search1")
        searchbar.attributedPlaceholder = NSAttributedString(string: "Enter anime movie title", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

        searchbar.layer.cornerRadius = 8
        searchbar.setLeftPaddingPoints(10)
        searchbar.returnKeyType = UIReturnKeyType.done
        searchbar.delegate = self

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false    
        view.addGestureRecognizer(tap)
        
        self.tableview.registerCell(SearchCell.className)
        self.tableview.dataSource = self
        self.tableview.separatorStyle = .none
        self.tableview.delegate = self
        self.tableview.keyboardDismissMode = .onDrag

        
        self.getlistItems(false)
        
        self.tableview.configRefreshFooter(container: self) {
            if self.textSearch != ""{
                self.getlistItemsSearch(true)
            }else{
                self.getlistItems(true)
            }
        }
        
        self.tableview.configRefreshHeader(container: self) {
            if self.textSearch != ""{
                self.getlistItemsSearch(false)
            }else{
                self.getlistItems(false)
            }
        }
        
        searchbar.addTarget(self, action: #selector(actionSearch), for: .editingChanged)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    @objc func actionSearch(){
        
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(timeInterval: 1,
                                            target: self,
                                            selector: #selector(updateSearch),
                                            userInfo: nil,
                                            repeats: false)
        
    }
    
    @objc func updateSearch(){
        self.textSearch = self.searchbar.text ?? ""
        if self.textSearch != ""{
            getlistItemsSearch(false)
        }else{
            getlistItems(false)
        }
    }
    
    func getlistItemsSearch(_ loadmore: Bool){
        if loadmore{
            self.page += 1
        }else{
            self.page = 1
            self.showLoadingIndicator()
        }

        SearchAPIManager.sharedInstance.listPopular(query: self.textSearch, page: String(self.page), success: { [weak self] (listItemsSearch) in
            
            guard let sSelf = self else {return}
            if loadmore{
                sSelf.listItem.append(contentsOf: listItemsSearch)
            }else{
                sSelf.listItem = listItemsSearch
            }

            sSelf.hideLoadingIndicator()
            sSelf.tableview.reloadData()
            if listItemsSearch.count == 0 {
                sSelf.tableview.switchRefreshFooter(to: .noMoreData)
            } else {
                sSelf.tableview.switchRefreshFooter(to: .normal)
            }
            sSelf.tableview.switchRefreshHeader(to: .normal(.success, 0.5))
        }) { [weak self] (error) in
            guard let sSelf = self else {return}
            print(error)
            sSelf.showToastAtBottom(message: error)
            sSelf.hideLoadingIndicator()
            sSelf.tableview.switchRefreshHeader(to: .normal(.success, 0.5))
            sSelf.tableview.switchRefreshFooter(to: .noMoreData)
        }
    }

    func getlistItems(_ loadmore: Bool) {
        if loadmore{
            self.page += 1
        }else{
            self.page = 1
            self.showLoadingIndicator()
        }

        AnimeAPIManager.sharedInstance.listPopular(type: 1, page: String(self.page), success: { [weak self] (listItems) in
            
            guard let sSelf = self else {return}
            if loadmore{
                sSelf.listItem.append(contentsOf: listItems)
            }else{
                sSelf.listItem = listItems
            }

            sSelf.hideLoadingIndicator()
            sSelf.tableview.reloadData()
            if listItems.count == 0 {
                sSelf.tableview.switchRefreshFooter(to: .noMoreData)
            } else {
                sSelf.tableview.switchRefreshFooter(to: .normal)
            }
            sSelf.tableview.switchRefreshHeader(to: .normal(.success, 0.5))
        }) { [weak self] (error) in
            guard let sSelf = self else {return}
            print(error)
            sSelf.showToastAtBottom(message: error)
            sSelf.hideLoadingIndicator()
            sSelf.tableview.switchRefreshHeader(to: .normal(.success, 0.5))
            sSelf.tableview.switchRefreshFooter(to: .noMoreData)
            
        }
    }
}

extension SearchVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.className, for: indexPath) as! SearchCell

        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.configCell(listItem[indexPath.row])
        return cell
    }
    
    
}
extension SearchVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailAnimeVC = DetailAnimeVC.loadFromNib()
        detailAnimeVC.id = String(listItem[indexPath.row].id ?? 0)
        guard let topVC = UIApplication.topViewController() else {
            return
        }
        
        //        topVC.navigationController?.pushViewController(detailAnimeVC, animated: true)
        self.hidesBottomBarWhenPushed  = true
        
        topVC.navigationController?.pushViewController(detailAnimeVC, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}
