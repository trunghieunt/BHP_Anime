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
            self.tableview.switchRefreshFooter(to: .normal)
        }
        
        self.tableview.configRefreshHeader(container: self) {
            if self.textSearch != ""{
                self.getlistItemsSearch(false)
            }else{
                self.getlistItems(false)
            }
            self.tableview.switchRefreshHeader(to: .normal(.success, 0.5))
        }
        
        searchbar.addTarget(self, action: #selector(actionSearch), for: .editingChanged)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    @objc func actionSearch(){
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
        }


        self.showLoadingIndicator()
        SearchAPIManager.sharedInstance.listPopular(query: self.textSearch, page: String(self.page), success: {(listItemsSearch) in
            
            if loadmore{
                self.listItem.append(contentsOf: listItemsSearch)
            }else{
                self.listItem = listItemsSearch
            }

            self.hideLoadingIndicator()

            self.tableview.reloadData()
        }) { (error) in
            print(error)
            self.showToastAtBottom(message: error)
            self.hideLoadingIndicator()
        }
    }

    func getlistItems(_ loadmore: Bool) {
        if loadmore{
            self.page += 1
        }else{
            self.page = 1
        }
        
        self.showLoadingIndicator()

        AnimeAPIManager.sharedInstance.listPopular(type: 1, page: String(self.page), success: { (listItems) in
            if loadmore{
                self.listItem.append(contentsOf: listItems)
            }else{
                self.listItem = listItems
            }

            self.hideLoadingIndicator()
            self.tableview.reloadData()
        }) { (error) in
            print(error)
            self.showToastAtBottom(message: error)
            self.hideLoadingIndicator()
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
