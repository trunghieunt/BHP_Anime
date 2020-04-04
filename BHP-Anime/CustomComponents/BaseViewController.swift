//
//  BaseViewController.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/4/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        configNavigationBarStyle()
    }
    
    func configNavigationBarStyle() {
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.init("#0C0E41")
        self.navigationController?.navigationBar.barTintColor = UIColor.init("#0C0E41")
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "")?.stretchableImage(withLeftCapWidth: 1, topCapHeight: 1), for: .default)
//        self.navigationController?.navigationBar.backIndicatorImage = UIImage.init()
//        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        self.view.backgroundColor = .white
    }
}
