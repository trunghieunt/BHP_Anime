//
//  BaseNavigationController.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/4/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//


import UIKit

class BaseNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let BarButtonItemAppearance = UIBarButtonItem.appearance()
        BarButtonItemAppearance.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        // Do any additional setup after loading the view.
        let titleAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init("#0C0E41"), NSAttributedString.Key.font: AppFonts.Verdana(30)]
        self.navigationBar.titleTextAttributes = titleAttributes
        self.navigationBar.backgroundColor = .white
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.tintColor = UIColor.init("#0C0E41")
    }

}
