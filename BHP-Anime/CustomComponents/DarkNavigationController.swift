//
//  DarkNavigationController.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/10/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit

class DarkNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
        let titleAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init("#0C0E41"), NSAttributedString.Key.font: AppFonts.Verdana(30)]
       self.navigationBar.titleTextAttributes = titleAttributes
       self.navigationBar.backgroundColor = .white
       self.navigationBar.isTranslucent = false
       self.navigationBar.barTintColor = UIColor.white
       self.navigationBar.tintColor = UIColor.init("#0C0E41")
    }

}

