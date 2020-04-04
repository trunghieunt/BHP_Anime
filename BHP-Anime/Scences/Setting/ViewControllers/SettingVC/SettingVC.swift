//
//  SettingVC.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/4/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit
import PopupDialog
import StoreKit
class SettingVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var itemCell : [SettingEnum] = [.rateApp, .feedBack, .shareThisApp, .upgrade, .about]
    var idApp = "1502872197"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
    }
 
    
    func configUI(){
        
        self.title = "Setting"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerCell(SettingCell.className)
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
//        tableView.separatorColor = UIColor.init("#212C31")

    }
    
    func jumpToAppStore(appId: String) {
        let url = "itms-apps://itunes.apple.com/app/id\(appId)"
        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        dismiss(animated: true, completion: nil)
    }


}

extension SettingVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch itemCell[indexPath.row]{
        case .rateApp:
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            } else {
                self.jumpToAppStore(appId: "1502872197")
            }
        case .feedBack:
            let popupVC = PopupDialog.init(viewController: SendEmailPP.loadFromNib(), tapGestureDismissal: false, panGestureDismissal: false)
            self.present(popupVC, animated: true, completion: nil)
            
        case .shareThisApp:
            if let urlStr = NSURL(string: "https://itunes.apple.com/us/app/myapp/id\(self.idApp)?ls=1&mt=8") {
                let objectsToShare = [urlStr]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

                if UI_USER_INTERFACE_IDIOM() == .pad {
                    if let popup = activityVC.popoverPresentationController {
                        popup.sourceView = self.view
                        popup.sourceRect = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 4, width: 0, height: 0)
                    }
                }

                self.present(activityVC, animated: true, completion: nil)
            }
        case .upgrade:
            
            let alert = UIAlertController(title: "Features will be updated later", message: "", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case .about:
            let aboutVC = AboutVC.loadFromNib
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(aboutVC(), animated: true)
            self.hidesBottomBarWhenPushed = false
            
            
        }
    }
    
}

extension SettingVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.className, for: indexPath) as! SettingCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.icCell.image = UIImage(named: itemCell[indexPath.row].img)
        cell.titleCell.text = itemCell[indexPath.row].title
        return cell
    }
    
    
}


