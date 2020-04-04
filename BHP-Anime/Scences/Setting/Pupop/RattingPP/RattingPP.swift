//
//  RattingPP.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/9/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit
import StoreKit

class RattingPP: UIViewController {

    @IBOutlet weak var outletComplete: UIButton!
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var view3: UIView!
    
    var ratting = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    func configUI(){
        view1.backgroundColor = AppColors.osloGray
        view1.layer.borderWidth = 0
        view2.backgroundColor = AppColors.osloGray
        view2.layer.borderWidth = 0
        view3.backgroundColor = .white
        view3.layer.borderColor = AppColors.OxfordBlue.cgColor
        view3.layer.borderWidth = 1
        
        view1.layer.cornerRadius = 8
        view2.layer.cornerRadius = 8
        view3.layer.cornerRadius = 8
        
        outletComplete.layer.cornerRadius = 6
    }

    @IBAction func actionExit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionComplete(_ sender: Any) {
        if ratting == 3{
            let alert = UIAlertController(title: "Would you like to rate us on the Appstore?", message: "", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (ok) in
                self.jumpToAppStore(appId: "1502872197")
            }))
            
            alert.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            self.showToast(position: .center, message: "Thank you for using our app!")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                self.dismiss(animated: true, completion: nil)
            })
            
        }
    }
    
    func jumpToAppStore(appId: String) {
        let url = "itms-apps://itunes.apple.com/app/id\(appId)"
        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func action1(_ sender: Any) {
        view1.layer.borderColor = AppColors.OxfordBlue.cgColor
        view1.layer.borderWidth = 1
        view1.backgroundColor = .white
        view2.backgroundColor = AppColors.osloGray
        view2.layer.borderWidth = 0
        view3.backgroundColor = AppColors.osloGray
        view3.layer.borderWidth = 0
        ratting = 1
    }
    
    @IBAction func action2(_ sender: Any) {
        view1.backgroundColor = AppColors.osloGray
        view1.layer.borderWidth = 0
        view2.backgroundColor = .white
        view2.layer.borderColor = AppColors.OxfordBlue.cgColor
        view2.layer.borderWidth = 1
        view3.backgroundColor = AppColors.osloGray
        view3.layer.borderWidth = 0
        ratting = 2
    }
    
    @IBAction func action3(_ sender: Any) {
        view1.backgroundColor = AppColors.osloGray
        view1.layer.borderWidth = 0
        view2.backgroundColor = AppColors.osloGray
        view2.layer.borderWidth = 0
        view3.backgroundColor = .white
        view3.layer.borderColor = AppColors.OxfordBlue.cgColor
        view3.layer.borderWidth = 1
        ratting = 3
    }
    
}
